{ config, lib, pkgs, ... } : {
	systemd = {
		enableCgroupAccounting = true;
		enableStrictShellChecks = true;
		tpm2 = {
			enable = true;
		};
		oomd = {
			enable = true;
			enableRootSlice = true;
			enableUserSlices = true;
			enableSystemSlice = true;
		};
		sysusers = {
			enable = true;
		};

	};
}
