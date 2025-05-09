{ pkgs, ... } : { 
	hardware = {
		cpu = {
			amd = {
				sev = {
					enable = true;
				};
				updateMicrocode = true;
			};
			x86 = {
				msr = {
					enable = true;
				};
			};
		};
		amdgpu = {
			initrd = {
				enable = true;
			};
		};
		graphics = {
			enable = true;
		};
	};
}
