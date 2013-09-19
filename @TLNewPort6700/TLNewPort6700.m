classdef TLNewPort6700 < handle
	properties (Access = protected)
        Buffer = '0000000000000000000000000000000000000000000000000000000000000000';
        hPanel;
        hPanel1;
        hPanel2;
        oTimer;
	end
	properties (SetAccess = protected, GetAccess = public)
		usbAddress = 1;
		productID = hex2dec('100A');
        qResponse = '';
    end
    events
        Connection;
        Control;
    end
	methods 
		function TL = TLNewPort6700(usbAddress)
			try
				if ~libisloaded('usbdll')
					loadlibrary('usbdll.dll','NewpDll.h');
				end
			catch
				herrordlg = errordlg('Cannot load files for Newport USB connection. Please check that usbdll.dll and NewpDll.h are in the right directory.');
			end
			if nargin>0
				TL.usbAddress = usbAddress;
			else
				TL.usbAddress = 1;
            end
            TL.ShowLayout;
		end
		f = Connect(TL);
		f = Disconnect(TL);
		f = tSendCommand(TL,Command);
		f = tGetStat(TL);
        f = CommandList(TL);
        f = SendCommand(TL,Command);
        f = Query(TL,Command);
        f = ShowLayout(TL);
        f = DeleteFcn(TL);
    end
end
