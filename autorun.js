run("wifi.recon on");
run("!sleep 2");
run("!wget --user user --password pass https://0.0.0.0:8083/api/session/wifi --no-check-certificate");
