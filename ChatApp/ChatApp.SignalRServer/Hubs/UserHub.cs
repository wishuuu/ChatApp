using Microsoft.AspNetCore.SignalR;
using Models;

namespace ChatApp.API.Hubs;

public class UserHub : Hub
{
    private readonly ILogger<UserHub> _logger;

    public UserHub(ILogger<UserHub> logger)
    {
        this._logger = logger;
    }

    public override Task OnConnectedAsync()
    {
        _logger.LogInformation("Connected {ConnectionId}", Context.ConnectionId);
        
        return base.OnConnectedAsync();
    }

    public async Task SendMessage(Message message)
    {
        await this.Clients.Others.SendAsync("Message", message);
    }

    public async Task Ping()
    {
        await this.Clients.Caller.SendAsync("Ping");
    }
}