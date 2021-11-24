defmodule Newsletter do
  def read_emails(path) do
    path
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
  end

  def open_log(path) do
    File.open!(path)
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    log = open_log(log_path)
    read_emails(emails_path)
    |> Enum.each(fn email ->
      send_fun(email)
      log_sent_email(log,email)
      end)
  end
end
