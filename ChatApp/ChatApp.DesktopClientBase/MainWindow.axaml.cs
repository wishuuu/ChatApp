using Avalonia.Controls;
using Avalonia.Interactivity;

namespace ChatApp.DesktopClient
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void send_button_click(object? sender, RoutedEventArgs e)
        {
            var button = (Button) sender!;

            var messageInput = MessageInput;
            var toSend = messageInput.Text;
            messageInput.Text = "";
            
            //send message to server
        }
    }
}