function f = CommandList(TL)
disp('Standard Commands');
disp('Syntax      Description');
disp('---------------------------------------------');
disp('*IDN?       Identification string query');
disp('*RCL        Recall controller settings');
disp('*RST        Reset the controller');
disp('*SAV        Save controller settings');
disp('*STB?       Query status byte');
disp('*OPC?       Query operation complete status');
disp('BEEP        Set controller beeper status');
disp('BEEP?       Query controller beeper status');
disp('BRIGHT      Set Menu display brightness level');
disp('BRIGHT?     Query Menu display brightness');
disp('ERRSTR?     Query error string');
disp('LOCKOUT     Set controller front panel state');
disp('LOCKOUT?    Query controller front panel state');
disp('ONDELAY     Set laser output ON delay');
disp('ONDELAY?    Query laser output ON delay');

f = 1;
end