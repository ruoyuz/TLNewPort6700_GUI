function f = ShowLayout(TL)
% Name:         Showlayout(TLNewPort6700)
% Category:     Instrument
% Author:       Ruoyu Zhang
% Last Date:    2012.06.04
%
% Discription:
%
%

% (Leave a blank line following the help.)

%  Initialization tasks
TL.hPanel = figure('Name','TLNewPort6700','NumberTitle','off',...
    'DeleteFcn',{@DeleteFcn},...
    'Units','pixels','Resize','off','MenuBar','none','Position',[50 50 480 380]);
TL.hPanel1 = uipanel(TL.hPanel,...
    'Unit','Normalized',...
    'Position',[0,1/4,1,3/4]);
TL.hPanel2 = uipanel(TL.hPanel,...
    'Title','Inspection',...
    'Unit','Normalized',...
    'Position',[0.01,0.01,0.98,1/4]);

hPanel1 = TL.hPanel1;
hPanel2 = TL.hPanel2;

%  Construct the components
hPN_Wavelength = uipanel(hPanel1,...
    'Title','Wavelength | Scan','Unit','Normalized',...
    'Position',[0.01,0.01,0.98,0.485]);

hTX_Wavelength = uicontrol(hPN_Wavelength,'Style','text',...
    'String','Wavelength - nm','Units','Normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.01,0.75,0.24,0.1]);
hED_Wavelength = uicontrol(hPN_Wavelength,'Style','edit',...
    'String','','Units','Normalized',...
    'BackgroundColor','white','HorizontalAlignment','right',...
    'Position',[0.01,0.55,0.2,0.2]);
hTX_PiezoVoltage = uicontrol(hPN_Wavelength,'Style','text',...
    'String','Piezo Voltage - %','Units','Normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.01,0.35,0.24,0.1]);
hED_PiezoVoltage = uicontrol(hPN_Wavelength,'Style','edit',...
    'String','','Units','Normalized',...
    'BackgroundColor','white','HorizontalAlignment','right',...
    'Position',[0.01,0.15,0.2,0.2]);

hPB_SetWavelength = uicontrol(hPN_Wavelength,'Style','pushbutton',...
    'String','Set','Units','Normalized',...
    'Position',[0.22,0.55,0.07,0.2],...
    'CallBack',{@PB_SetWavelength_Callback});
hPB_SetPiezo = uicontrol(hPN_Wavelength,'Style','pushbutton',...
    'String','Set','Units','Normalized',...
    'Position',[0.22,0.15,0.07,0.2],...
    'CallBack',{@PB_SetPiezo_Callback});



hTX_VerticalBar1 = uicontrol(hPN_Wavelength,'Style','text',...
    'String',sprintf('|\n|\n|\n|\n|\n|\n|\n|\n|\n|'),'Units','Normalized',...
    'ForegroundColor',[0.4 0.4 0.4],...
    'HorizontalAlignment','left',...
    'Position',[0.3,0.01,0.05,0.98]);
hTX_StartWavelength = uicontrol(hPN_Wavelength,'Style','text',...
    'String','Start - nm','Units','Normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.35,0.75,0.25,0.1]);
hED_StartWavelength = uicontrol(hPN_Wavelength,'Style','edit',...
    'String','','Units','Normalized',...
    'BackgroundColor','white','HorizontalAlignment','right',...
    'Position',[0.35,0.55,0.2,0.2]);
hTX_Range = uicontrol(hPN_Wavelength,'Style','text',...
    'String','Range - nm','Units','Normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.35,0.35,0.25,0.1]);
hED_Range = uicontrol(hPN_Wavelength,'Style','edit',...
    'String','','Units','Normalized',...
    'BackgroundColor','white','HorizontalAlignment','right',...
    'Position',[0.35,0.15,0.2,0.2]);

hTX_Velocity = uicontrol(hPN_Wavelength,'Style','text',...
    'String','Velocity - nm/s','Units','Normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.6,0.75,0.25,0.1]);
hED_Velocity = uicontrol(hPN_Wavelength,'Style','edit',...
    'String','','Units','Normalized',...
    'BackgroundColor','white','HorizontalAlignment','right',...
    'Position',[0.6,0.55,0.2,0.2]);
hTX_RVelocity = uicontrol(hPN_Wavelength,'Style','text',...
    'String','R Velocity - nm/s','Units','Normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.6,0.35,0.25,0.1]);
hED_RVelocity = uicontrol(hPN_Wavelength,'Style','edit',...
    'String','','Units','Normalized',...
    'BackgroundColor','white','HorizontalAlignment','right',...
    'Position',[0.6,0.15,0.2,0.2]);


hPB_SetScan = uicontrol(hPN_Wavelength,'Style','pushbutton',...
    'String','Set','Units','Normalized',...
    'Position',[0.84,0.48,0.15,0.26],...
    'CallBack',{@PB_SetScan_Callback});
hPB_Scan = uicontrol(hPN_Wavelength,'Style','pushbutton',...
    'String','Scan','Units','Normalized',...
    'Position',[0.84,0.15,0.15,0.32],...
    'CallBack',{@PB_Scan_Callback});

hPN_Power = uipanel(hPanel1,...
    'Title','Power/Current','Unit','Normalized',...
    'Position',[0.01,0.505,0.69,0.485]);
hRB_Power = uicontrol(hPN_Power,'Style','radiobutton',...
    'String','<html><center>Constant<br><center>Power','Units','Normalized',...
    'Position',[0.01,0.6,0.25,0.2],...
    'CallBack',{@RB_Power_Callback});
hRB_Current = uicontrol(hPN_Power,'Style','radiobutton',...
    'String','<html><center>Constant<br><center>Current','Units','Normalized',...
    'Position',[0.01,0.2,0.25,0.2],...
    'CallBack',{@RB_Current_Callback});
hED_Power = uicontrol(hPN_Power,'Style','edit',...
    'String','','Units','Normalized',...
    'BackgroundColor','white','HorizontalAlignment','right',...
    'Position',[0.3,0.6,0.25,0.2]);
hTX_Power = uicontrol(hPN_Power,'Style','text',...
    'String','mW','Units','Normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.55,0.6,0.1,0.15]);
hED_Current = uicontrol(hPN_Power,'Style','edit',...
    'String','','Units','Normalized',...
    'BackgroundColor','white','HorizontalAlignment','right',...
    'Position',[0.3,0.2,0.25,0.2]);
hTX_Current = uicontrol(hPN_Power,'Style','text',...
    'String','mA','Units','Normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.55,0.2,0.1,0.15]);

hPB_SetPower = uicontrol(hPN_Power,'Style','pushbutton',...
    'String','Set','Units','Normalized',...
    'Position',[0.65,0.2,0.3,0.6],...
    'CallBack',{@PB_SetPower_Callback});

hTB_Track = uicontrol(hPanel1,'Style','togglebutton',...
    'String','<html><center>Track:<br><center>???','Units','Normalized',...
    'Max',1,...
    'Position',[0.855,0.645,0.135,0.155],...
    'CallBack',{@TB_Track_Callback});

hTB_Control = uicontrol(hPanel1,'Style','togglebutton',...
    'String','<html><center>Control:<br><center>???','Units','Normalized',...
    'Max',1,...
    'Position',[0.71,0.645,0.135,0.155],...
    'CallBack',{@TB_Control_Callback});

hTB_Connect = uicontrol(hPanel1,'Style','togglebutton',...
    'String','<html><center>Connect:<br><center>Off','Units','Normalized',...
    'Max',1,'ForegroundColor','red',...
    'Position',[0.71,0.81,0.135,0.155],...
    'CallBack',{@TB_Connect_Callback});

hTB_Output = uicontrol(hPanel1,'Style','togglebutton',...
    'String','<html><center>Output:<br><center>???','Units','Normalized',...
    'Max',1,...
    'Position',[0.855,0.81,0.135,0.155],...
    'CallBack',{@TB_Output_Callback});

hPB_SetAll = uicontrol(hPanel1,'Style','pushbutton',...
    'String','Set All','Units','Normalized',...
    'Position',[0.71,0.505,0.28,0.13],...
    'CallBack',{@PB_SetAll_Callback});

hTX_IWavelength1 = uicontrol(hPanel2,'Style','text',...
    'String','Wavelength - nm','Units','normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.01 0.74 0.24 0.16]);
hTX_IWavelength2 = uicontrol(hPanel2,'Style','text',...
    'String','-','Units','normalized',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'HorizontalAlignment','center',...
    'Position',[0.09 0.55 0.24 0.16]);

hTX_IPiezoVoltage1 = uicontrol(hPanel2,'Style','text',...
    'String','Piezo Voltage - %','Units','normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.01 0.29 0.24 0.16]);
hTX_IPiezoVoltage2 = uicontrol(hPanel2,'Style','text',...
    'String','-','Units','normalized',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'HorizontalAlignment','center',...
    'Position',[0.09 0.1 0.24 0.16]);

hTX_IPower1 = uicontrol(hPanel2,'Style','text',...
    'String','Power - mW','Units','normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.34 0.74 0.24 0.16]);
hTX_IPower2 = uicontrol(hPanel2,'Style','text',...
    'String','-','Units','normalized',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'HorizontalAlignment','center',...
    'Position',[0.42 0.55 0.24 0.16]);

hTX_ICurrent1 = uicontrol(hPanel2,'Style','text',...
    'String','Current - mA','Units','normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.34 0.29 0.24 0.16]);
hTX_ICurrent2 = uicontrol(hPanel2,'Style','text',...
    'String','-','Units','normalized',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'HorizontalAlignment','center',...
    'Position',[0.42 0.1 0.24 0.16]);

hTX_IDiodeTemperature1 = uicontrol(hPanel2,'Style','text',...
    'String','Diode Temp. - C','Units','normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.67 0.74 0.24 0.16]);
hTX_IDiodeTemperature2 = uicontrol(hPanel2,'Style','text',...
    'String','-','Units','normalized',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'HorizontalAlignment','center',...
    'Position',[0.75 0.55 0.24 0.16]);

hTX_ICavityTemperature1 = uicontrol(hPanel2,'Style','text',...
    'String','Cavity Temp. - C','Units','normalized',...
    'HorizontalAlignment','left',...
    'Position',[0.67 0.29 0.24 0.16]);
hTX_ICavityTemperature2 = uicontrol(hPanel2,'Style','text',...
    'String','-','Units','normalized',...
    'BackgroundColor',[0.8 0.8 0.8],...
    'HorizontalAlignment','center',...
    'Position',[0.75 0.1 0.24 0.16]);


handles.hTB_Connect = hTB_Connect;
handles.hTB_Output = hTB_Output;
handles.hTB_Control = hTB_Control;
handles.hTB_Track = hTB_Track;
handles.hPB_SetAll = hPB_SetAll;
handles.hRB_Power = hRB_Power;
handles.hRB_Current = hRB_Current;
handles.hED_Power = hED_Power;
handles.hED_Current = hED_Current;
handles.hPB_SetPower = hPB_SetPower;
handles.hED_Wavelength = hED_Wavelength;
handles.hED_PiezoVoltage = hED_PiezoVoltage;
handles.hPB_SetWavelength = hPB_SetWavelength;
handles.hPB_SetPiezo = hPB_SetPiezo;
handles.hED_StartWavelength = hED_StartWavelength;
handles.hED_Range = hED_Range;
handles.hED_Velocity = hED_Velocity;
handles.hED_RVelocity = hED_RVelocity;
handles.hPB_SetScan = hPB_SetScan;
handles.hPB_Scan = hPB_Scan;

handles.hTX_IWavelength = hTX_IWavelength2;
handles.hTX_IPiezoVoltage = hTX_IPiezoVoltage2;
handles.hTX_IPower = hTX_IPower2;
handles.hTX_ICurrent = hTX_ICurrent2;
handles.hTX_IDiodeTemperature = hTX_IDiodeTemperature2;
handles.hTX_ICavityTemperature = hTX_ICavityTemperature2;


% Listeners&Timers
lhTB_Connect = addlistener(TL,'Connection',@TB_Connection_LCallback);
lhTB_Control = addlistener(TL,'Control',@TB_Control_LCallback);
TL.oTimer = timer('TimerFcn',@Inspection_TCallback,'ExecutionMode','fixedSpacing','Period',1.0);


%  Initialization tasks
notify(TL,'Control');
notify(TL,'Connection');

%  Callbacks

    function PB_SetWavelength_Callback(hObject,eventdata)
        s = get(hED_Wavelength,'String');
        a = str2double(s); 
        ss = sprintf('%07.2f',a);
        TL.SendCommand(['SOUR:WAVE ',ss]);
    end

    function PB_SetPiezo_Callback(hObject,eventdata)
        s = get(hED_PiezoVoltage,'String');
        a = str2double(s); 
        ss = sprintf('%06.2f',a);
        TL.SendCommand(['SOUR:VOLT:PIEZ ',ss]);
    end

    function PB_SetScan_Callback(hObject,eventdata)
        s1 = get(hED_StartWavelength,'String');
        a1 = str2double(s1); 
        ss1 = sprintf('%07.2f',a1);
        TL.SendCommand(['SOUR:WAVE:START ',ss1]);
        
        s2 = get(hED_Range,'String');
        a2 = str2double(s2);
        aa2 = a2+a1;
        ss2 = sprintf('%07.2f',aa2);
        TL.SendCommand(['SOUR:WAVE:STOP ',ss2]);   
        
        s3 = get(hED_Velocity,'String');
        a3 = str2double(s3); 
        ss3 = sprintf('%05.2f',a3);
        TL.SendCommand(['SOUR:WAVE:SLEW:FORW ',ss3]);
        
        s4 = get(hED_RVelocity,'String');
        a4 = str2double(s4); 
        ss4 = sprintf('%05.2f',a4);
        TL.SendCommand(['SOUR:WAVE:SLEW:RET ',ss4]);    
    end

    function PB_Scan_Callback(hObject,eventdata)
        TL.SendCommand('OUTP:SCAN:START');
    end

    function RB_Power_Callback(hObject,eventdata)
        if  get(handles.hRB_Power,'Value')
            set(handles.hRB_Current,'Value',0);
            set(handles.hRB_Power,'Value',1);
            set(handles.hED_Current,'Enable','off');
            set(handles.hED_Power,'Enable','on');
        else
            set(handles.hRB_Power,'Value',1);
            set(handles.hED_Power,'Enable','on');
            set(handles.hRB_Current,'Value',0);
            set(handles.hED_Current,'Enable','off');
        end
    end 

    function RB_Current_Callback(hObject,eventdata)
        if  get(handles.hRB_Current,'Value')
            set(handles.hRB_Power,'Value',0);
            set(handles.hRB_Current,'Value',1);
            set(handles.hED_Power,'Enable','off');
            set(handles.hED_Current,'Enable','on');
        else
            set(handles.hRB_Current,'Value',1);
            set(handles.hED_Current,'Enable','on');
            set(handles.hRB_Power,'Value',0);
            set(handles.hED_Power,'Enable','off');
            get(TL.oTimer,'Running')
        end
    end

    function PB_SetPower_Callback(hObject,eventdata)
        if get(handles.hRB_Current,'Value')
            s = get(hED_Current,'String');
            a = str2double(s); 
            ss = sprintf('%07.2f',a);
            TL.SendCommand('SOUR:CPOW 0');
            TL.SendCommand(['SOUR:CURR:DIOD ',ss]);
        else if get(handles.hRB_Power,'Value')
                s = get(hED_Power,'String');
                a = str2double(s); 
                ss = sprintf('%07.2f',a);
                TL.SendCommand('SOUR:CPOW 1');
                TL.SendCommand(['SOUR:POW:DIOD ',ss]);
             else msgbox('Power set could not work properly. Please check the program.','warn');
             end
        end
    end

    function TB_Track_Callback(hObject,eventdata)
        if get(handles.hTB_Track,'Value')
            TL.SendCommand('OUTP:TRAC 1');
            set(handles.hTB_Track,'String','<html><center>Track:<br><center>On');
            set(handles.hTB_Track,'ForegroundColor','green');
        else
            TL.SendCommand('OUTP:TRAC 0');
            set(handles.hTB_Track,'String','<html><center>Track:<br><center>Off');
            set(handles.hTB_Track,'ForegroundColor','black');
        end 
    end

    function TB_Control_Callback(hObject,eventdata)
        if get(handles.hTB_Control,'Value')
            TL.SendCommand('SYST:MCON REM');
        else
            TL.SendCommand('SYST:MCON LOC');
        end 
        notify(TL,'Control');
    end

    function TB_Connect_Callback(hObject,eventdata)
        if get(handles.hTB_Connect,'Value')
            TL.Connect;
            notify(TL,'Connection');
            SetInitialize;
        else
            notify(TL,'Connection');
            TL.Disconnect;
        end         
    end

    function TB_Output_Callback(hObject,eventdata)
        if get(handles.hTB_Output,'Value')
            TL.SendCommand('OUTP:STAT 1');
            set(handles.hTB_Output,'String','<html><center>Output:<br><center>On');
            set(handles.hTB_Output,'ForegroundColor','green');
        else
            TL.SendCommand('OUTP:STAT 0');
            set(handles.hTB_Output,'String','<html><center>Output:<br><center>Off');
            set(handles.hTB_Output,'ForegroundColor','black');
        end 
    end

    function PB_SetAll_Callback(hObject,eventdata)
        PB_SetPower_Callback;
        PB_SetWavelength_Callback;
        PB_SetPiezo_Callback;
        PB_SetScan_Callback;
    end

% Listener&Timer Callbacks
    function TB_Connection_LCallback(hObject,eventdata)
        if get(handles.hTB_Connect,'Value')
            set(handles.hTB_Connect,'String','<html><center>Connect:<br><center>On');
            set(handles.hTB_Connect,'ForegroundColor','green');
            
            set(handles.hTB_Track,'Enable','on');
            set(handles.hTB_Output,'Enable','on');
            set(handles.hRB_Power,'Enable','on');
            set(handles.hRB_Current,'Enable','on');
            set(handles.hED_Power,'Enable','on');
            set(handles.hED_Current,'Enable','on');
            set(handles.hED_Wavelength,'Enable','on');
            set(handles.hED_PiezoVoltage,'Enable','on');
            set(handles.hED_StartWavelength,'Enable','on');
            set(handles.hED_Range,'Enable','on');
            set(handles.hED_Velocity,'Enable','on');
            set(handles.hED_RVelocity,'Enable','on');

            start(TL.oTimer);
            
            set(handles.hTB_Control,'Enable','on');
            TB_Control_Callback;         
        else
            set(handles.hTB_Connect,'String','<html><center>Connect:<br><center>Off');
            set(handles.hTB_Connect,'ForegroundColor','red');
            set(handles.hTB_Track,'Enable','off');
            set(handles.hTB_Output,'Enable','off');
            set(handles.hRB_Power,'Enable','off');
            set(handles.hRB_Current,'Enable','off');
            set(handles.hED_Power,'Enable','off');
            set(handles.hED_Current,'Enable','off');
            set(handles.hED_Wavelength,'Enable','off');
            set(handles.hED_PiezoVoltage,'Enable','off');
            set(handles.hED_StartWavelength,'Enable','off');
            set(handles.hED_Range,'Enable','off');
            set(handles.hED_Velocity,'Enable','off');
            set(handles.hED_RVelocity,'Enable','off'); 
            
            stop(TL.oTimer);
            
            if (strcmp(get(handles.hTB_Control,'Enable'),'on'))
            set(handles.hTB_Control,'Value',0);
            TB_Control_Callback;
            set(handles.hTB_Control,'Enable','off');
            end
            
            set(handles.hTB_Control,'String','<html><center>Control:<br><center>???');
            set(handles.hTB_Track,'String','<html><center>Track:<br><center>???');
            set(handles.hTB_Output,'String','<html><center>Output:<br><center>???');
        end
    end

    function TB_Control_LCallback(hObject,eventdata)
        if get(handles.hTB_Control,'Value')
            set(handles.hTB_Control,'String','<html><center>Control:<br><center>Remote');
            set(handles.hPB_SetPower,'Enable','on');
            set(handles.hPB_SetWavelength,'Enable','on');
            set(handles.hPB_SetPiezo,'Enable','on');
            set(handles.hPB_SetScan,'Enable','on');
            set(handles.hPB_Scan,'Enable','on');
            set(handles.hPB_SetAll,'Enable','on');              
        else
            set(handles.hTB_Control,'String','<html><center>Control:<br><center>Manual');
            set(handles.hPB_SetPower,'Enable','off');
            set(handles.hPB_SetWavelength,'Enable','off');
            set(handles.hPB_SetPiezo,'Enable','off');
            set(handles.hPB_SetScan,'Enable','off');
            set(handles.hPB_Scan,'Enable','off');
            set(handles.hPB_SetAll,'Enable','off');               
        end
    end

    function Inspection_TCallback(hObject,eventdata)
        TL.SendCommand('SENS:WAVE');
        s1 = TL.qResponse;
        set(handles.hTX_IWavelength,'String',s1);  
        
        TL.SendCommand('SOUR:VOLT:PIEZ?');
        s2 = TL.qResponse;
        set(handles.hTX_IPiezoVoltage,'String',s2);  
        
        TL.SendCommand('SENS:POW:DIOD');
        s3 = TL.qResponse;
        a3 = str2double(s3);
        ss3 = sprintf('%6.2f',a3);
        set(handles.hTX_IPower,'String',ss3);  
        
        TL.SendCommand('SENS:CURR:DIOD');
        s4 = TL.qResponse;
        a4 = str2double(s4);
        ss4 = sprintf('%6.2f',a4);       
        set(handles.hTX_ICurrent,'String',ss4);  
        
        TL.SendCommand('SENS:TEMP:DIOD');
        s5 = TL.qResponse;
        set(handles.hTX_IDiodeTemperature,'String',s5);      
        
        TL.SendCommand('SENS:TEMP:CAV');
        s6 = TL.qResponse;
        set(handles.hTX_ICavityTemperature,'String',s6);  
    end

    function Inspection_TStop(hObject,eventdata)
        start(TL.oTimer);
    end


%  Utility functions
    function SetInitialize()
        TL.SendCommand('OUTP:STAT?');
        if str2double(TL.qResponse)
            set(handles.hTB_Output,'Value',1);
            set(handles.hTB_Output,'String','<html><center>Output:<br><center>On');
            set(handles.hTB_Output,'ForegroundColor','green');
        else
            set(handles.hTB_Output,'Value',0);
            set(handles.hTB_Output,'String','<html><center>Output:<br><center>Off');
            set(handles.hTB_Output,'ForegroundColor','black');
        end
        
        TL.SendCommand('OUTP:TRAC?');
        if str2double(TL.qResponse)
            set(handles.hTB_Track,'Value',1);
            set(handles.hTB_Track,'String','<html><center>Track:<br><center>On');
            set(handles.hTB_Track,'ForegroundColor','green');
        else
            set(handles.hTB_Track,'Value',0);
            set(handles.hTB_Track,'String','<html><center>Track:<br><center>Off');
            set(handles.hTB_Track,'ForegroundColor','black');
        end        

        TL.SendCommand('SOUR:CPOW?');
        if str2double(TL.qResponse)
            set(handles.hRB_Power,'Value',1);
            RB_Power_Callback;
            TL.SendCommand('SOUR:POW:DIOD?');
            s1 = sTL.qResponse;
            set(handles.hED_Power,'String',s1);
        else
            set(handles.hRB_Current,'Value',1);
            RB_Current_Callback;
            TL.SendCommand('SOUR:CURR:DIOD?');
            s1 = TL.qResponse;
            set(handles.hED_Current,'String',s1);
        end
            
        TL.SendCommand('SOUR:WAVE?');
        s2 = TL.qResponse;
        set(handles.hED_Wavelength,'String',s2);       
        
        TL.SendCommand('SOUR:VOLT:PIEZ?');
        s3 = TL.qResponse;
        set(handles.hED_PiezoVoltage,'String',s3);  
        
        TL.SendCommand('SOUR:WAVE:START?');
        s4 = TL.qResponse;
        set(handles.hED_StartWavelength,'String',s4); 
        
        TL.SendCommand('SOUR:WAVE:STOP?');
        a5 = str2double(TL.qResponse)-str2double(s4);
        s5 = sprintf('%05.2f',a5);
        set(handles.hED_Range,'String',s5);  
        
        TL.SendCommand('SOUR:WAVE:SLEW:FORW?');
        s6 = TL.qResponse;
        set(handles.hED_Velocity,'String',s6);         
        
        TL.SendCommand('SOUR:WAVE:SLEW:RET?');
        s7 = TL.qResponse;
        set(handles.hED_RVelocity,'String',s7);            
        
    end

    function DeleteFcn(hObject,eventdata)
        TL.Disconnect;
        delete(TL.oTimer);
        delete(lhTB_Connect);
        delete(lhTB_Control);
    end

end