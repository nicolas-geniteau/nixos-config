{
  lib,
  config,
  ...
}: {
  networking.useDHCP = lib.mkForce false;

  systemd.network = {
    enable = true;
    networks = {
      "10-wire" = {
        matchConfig.Name = "en*";
        networkConfig = {
          DHCP = "ipv4";
          IPv6AcceptRA = true;
          Domains = ["."];
          MulticastDNS = "resolve";
        };
        dhcpV4Config = {
          UseDNS = false;
        };
        ipv6AcceptRAConfig = {
          UseDNS = false;
        };
      };
      "10-wireless" = {
        matchConfig.Name = "wl*";
        networkConfig = {
          DHCP = "ipv4";
          IPv6AcceptRA = true;
          Domains = ["."];
          MulticastDNS = "resolve";
        };
        dhcpV4Config = {
          UseDNS = false;
          RouteMetric = 20;
        };
        ipv6AcceptRAConfig = {
          UseDNS = false;
        };
      };
    };
  };

  systemd.services.systemd-networkd-wait-online.serviceConfig.ExecStart = [
    ""
    "${config.systemd.package}/lib/systemd/systemd-networkd-wait-online --any"
  ];

  networking.nameservers = [
    "2606:4700:4700::1111#one.one.one.one"
    "2606:4700:4700::1001#one.one.one.one"
  ];

  services.resolved = {
    enable = true;
    domains = ["~."];
    dnsovertls = "true";
    fallbackDns = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
    extraConfig = ''
      MulticastDNS=resolve
    '';
  };

  services.openssh = {
    enable = true;
  };
}
