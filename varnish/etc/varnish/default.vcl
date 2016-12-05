vcl 4.0;
import directors;
import std;

backend server1 {
    .host = "10.99.0.10";
    .port = "80";
}

backend server2 {
    .host = "10.99.0.13";
    .port = "80";
}

sub vcl_init {
    new vdir = directors.round_robin();
    vdir.add_backend(server1);
    vdir.add_backend(server2);
}

sub vcl_recv {
    if (req.restarts == 0) {
        if (req.http.x-forwarded-for) {
            set req.http.X-Forwarded-For = req.http.X-Forwarded-For;
        } else {
            set req.http.X-Forwarded-For = client.ip;
        }
    }

    if (client.ip != "127.0.0.1" && std.port(server.ip) == 80 && req.http.host ~ "^(?i)(www\.)?(ktarow.com|4ris4.info)") {
        set req.http.x-redir = "https://" + req.http.host + req.url;
        std.log(req.http.x-redir);
        return (synth(850, "Moved permanently"));
    }

    set req.backend_hint = vdir.backend();
}

sub vcl_synth {
    if (resp.status == 850) {
        set resp.http.Location = req.http.x-redir;
        set resp.status = 301;
        return (deliver);
    }
}
