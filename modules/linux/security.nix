{ config, lib, pkgs, ... } : {
	security = {
		protectKernelImage = true;
		forcePageTableIsolation = true;
		tpm2 = {
			enable = true;
			applyUdevRules = true;
		};
		shadow = {
			enable = true;
		};
		rtkit = {
			enable = true;
		};
		polkit = {
			enable = true;
		};
		auditd = {
			enable = true;
		};
		audit = {
			enable = true;
			rules = [
				"-a exit,always -F arch=x86_64 -S execve"
			];
			backlogLimit = 8192;
		};
	};
	services.journald = {
		audit = true;
	};
}
