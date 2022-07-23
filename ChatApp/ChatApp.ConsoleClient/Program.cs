using ChatApp.API.Hubs;
using Microsoft.AspNetCore.SignalR.Client;
using Models;

Console.WriteLine("Na jaki serwer chcesz się połączyć?");
var server = Console.ReadLine();

Console.WriteLine("Podaj swoje imię");
var name = Console.ReadLine();

HubConnection connection = new HubConnectionBuilder()
    .WithUrl(server ?? "https://localhost:5001/signalr/join", (opts) =>
    {
        opts.HttpMessageHandlerFactory = (message) =>
        {
            if (message is HttpClientHandler clientHandler)
                // bypass SSL certificate
                clientHandler.ServerCertificateCustomValidationCallback +=
                    (sender, certificate, chain, sslPolicyErrors) => { return true; };
            return message;
        };
    })
    .WithAutomaticReconnect()
    .Build();

connection.On<Message>("Message", message =>
{
    Console.WriteLine(message.Sender + ":");
    Console.WriteLine(message.Text);
});

Console.WriteLine($"Connecting... {server}");
await connection.StartAsync();
Console.WriteLine($"Connected. {connection.ConnectionId}");
Console.WriteLine("Press CTRL+C to stop connection");

while (true)
{
    var text = Console.ReadLine();
    var message = new Message();
    message.Sender = name;
    message.Text = text;

    await connection.SendAsync(nameof(UserHub.SendMessage), message);
}