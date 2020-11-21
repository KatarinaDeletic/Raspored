using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Net.Mime;

namespace Domain
{
    public class EmailOption
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string SrcMail { get; set; }
        public string Host { get; set; }
        public short Port { get; set; }
    }
    public class EmailNotifier
    {
        public string Username { get; private set; }
        public string Password { get; private set; }
        public string SrcMail { get; private set; }
        public string Host { get; private set; }
        public short Port { get; set; }


        public EmailNotifier(IOptions<EmailOption> options)
        {
            if (options == null) return;
            Username = options.Value.Username;
            Password = options.Value.Password;
            SrcMail = options.Value.SrcMail;
            Host = options.Value.Host;
            Port = options.Value.Port;
        }

        public void Send(string dest, string emailbody)
        {
            try
            {
                string _sender = "sender@elfak.rs";
                string _password = "password";

                SmtpClient client = new SmtpClient(Host);

                client.Port = Port;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                System.Net.NetworkCredential credentials =
                    new System.Net.NetworkCredential(_sender, _password);
                client.EnableSsl = true;
                client.Credentials = credentials;

                MailMessage message = new MailMessage(_sender, dest);
                message.Subject = "Izmena u rasporedu!";
                message.Body = emailbody;
                client.Send(message);

            }
            catch (Exception exp)
            {
                Console.WriteLine(exp.ToString());
            }
                      
        }
    }
}
