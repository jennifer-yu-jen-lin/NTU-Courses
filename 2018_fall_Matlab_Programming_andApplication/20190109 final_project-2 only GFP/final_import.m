function varargout = final_import(varargin)
% FINAL_IMPORT MATLAB code for final_import.fig
%      FINAL_IMPORT, by itself, creates a new FINAL_IMPORT or raises the existing
%      singleton*.
%
%      H = FINAL_IMPORT returns the handle to a new FINAL_IMPORT or the handle to
%      the existing singleton*.
%
%      FINAL_IMPORT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_IMPORT.M with the given input arguments.
%
%      FINAL_IMPORT('Property','Value',...) creates a new FINAL_IMPORT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_import_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_import_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final_import

% Last Modified by GUIDE v2.5 08-Jan-2019 22:14:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_import_OpeningFcn, ...
                   'gui_OutputFcn',  @final_import_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before final_import is made visible.
function final_import_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final_import (see VARARGIN)

% Choose default command line output for final_import
handles.output = hObject;

% 將最後須輸出的資料,先設定為0,確定所有物件皆有被定義，在傳遞資料時才不會有錯誤產生
% 若使用者有從 Import Data 輸入資料,則以下的資料會被更新成真正實驗的資料
Standard_OD = zeros(3,97);
Standard_GFP = zeros(3,97);
time_OD = zeros(3,1);
time_GFP = zeros(3,1);
Strain_zeros = struct('OD',{ Standard_OD(:,[4:6 15:26 ]),...
                       Standard_OD(:,[7:9 27:38 ]),...
                       Standard_OD(:,[10:12 39:50 ]),...
                       Standard_OD(:,[88:90 51:62 ]),...
                       Standard_OD(:,[91:93 63:74 ]),...
                       Standard_OD(:,[94:96 75:86 ]) },...
               'GFP',{ Standard_GFP(:,[4:6 15:26 ]),...
                       Standard_GFP(:,[7:9 27:38 ]),...
                       Standard_GFP(:,[10:12 39:50 ]),...
                       Standard_GFP(:,[88:90 51:62 ]),...
                       Standard_GFP(:,[91:93 63:74 ]),...
                       Standard_GFP(:,[94:96 75:86 ]) } ,...
               'time',{time_OD, time_GFP, 0, 0, 0, 0} );
handles.StrainUnderCd = Strain_zeros;
handles.StrainUnderPb = Strain_zeros;
handles.StrainUnderHg = Strain_zeros;
handles.StrainUnderZn = Strain_zeros;
handles.StrainUnderCo = Strain_zeros;
handles.StrainUnderNi = Strain_zeros;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final_import wait for user response (see UIRESUME)
% uiwait(handles.final_import_Tag);
uiwait(handles.final_import_Tag);

% --- Outputs from this function are returned to the command line.
function varargout = final_import_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
delete(handles.final_import_Tag); % 刪除子 GUI, 最後按 Finish 時,會關閉視窗

%%% 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in Conc_Cd.
function Conc_Cd_Callback(hObject, eventdata, handles)
% hObject    handle to Conc_Cd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Conc_Cd contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Conc_Cd


% --- Executes during object creation, after setting all properties.
function Conc_Cd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Conc_Cd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Conc_Pb.
function Conc_Pb_Callback(hObject, eventdata, handles)
% hObject    handle to Conc_Pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Conc_Pb contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Conc_Pb


% --- Executes during object creation, after setting all properties.
function Conc_Pb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Conc_Pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Conc_Hg.
function Conc_Hg_Callback(hObject, eventdata, handles)
% hObject    handle to Conc_Hg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Conc_Hg contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Conc_Hg


% --- Executes during object creation, after setting all properties.
function Conc_Hg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Conc_Hg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Conc_Zn.
function Conc_Zn_Callback(hObject, eventdata, handles)
% hObject    handle to Conc_Zn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Conc_Zn contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Conc_Zn


% --- Executes during object creation, after setting all properties.
function Conc_Zn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Conc_Zn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Conc_Co.
function Conc_Co_Callback(hObject, eventdata, handles)
% hObject    handle to Conc_Co (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Conc_Co contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Conc_Co


% --- Executes during object creation, after setting all properties.
function Conc_Co_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Conc_Co (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Conc_Ni.
function Conc_Ni_Callback(hObject, eventdata, handles)
% hObject    handle to Conc_Ni (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Conc_Ni contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Conc_Ni


% --- Executes during object creation, after setting all properties.
function Conc_Ni_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Conc_Ni (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%% 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in Import_Cd.
function Import_Cd_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Cd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Data Import
[filename, filepath] = uigetfile({'*.xlsx'; '*.xls'}, 'Select Data');
Vfile = [filepath, filename];
format shortG;
[RawData] = xlsread(Vfile);
set(handles.Import_Path_Cd, 'String', Vfile)

%% Data Processing
s = size(RawData);
CycleNo = ( (s(1)-46)-3+1 ) / 2;

% RawData(46,1) = 0
RawData_OD = RawData(46:(46+CycleNo-1) , : );
RawData_GFP = RawData((46+CycleNo+3):s , : );

Temp = RawData_OD(:,2);
for t = 1:length(Temp)
    if Temp(t) >= 37
        ToBeMinus = t;
        break
    end
end

Standard_OD = RawData_OD - RawData_OD(ToBeMinus,:);
Standard_GFP = (RawData_GFP - RawData_GFP(ToBeMinus,:)) ./ Standard_OD; % fluorescence(GFP) per cell(OD)

time_OD = RawData_OD(:,1)/3600; % sec -> hr
time_GFP = RawData_GFP(:,1)/3600; % sec -> hr

Strain = struct('OD',{ Standard_OD(:,[4:6 15:26 ]),...
                       Standard_OD(:,[7:9 27:38 ]),...
                       Standard_OD(:,[10:12 39:50 ]),...
                       Standard_OD(:,[88:90 51:62 ]),...
                       Standard_OD(:,[91:93 63:74 ]),...
                       Standard_OD(:,[94:96 75:86 ]) },...
               'GFP',{ Standard_GFP(:,[4:6 15:26 ]),...
                       Standard_GFP(:,[7:9 27:38 ]),...
                       Standard_GFP(:,[10:12 39:50 ]),...
                       Standard_GFP(:,[88:90 51:62 ]),...
                       Standard_GFP(:,[91:93 63:74 ]),...
                       Standard_GFP(:,[94:96 75:86 ]) } ,...
               'time',{time_OD, time_GFP, 0, 0, 0, 0} );
handles.StrainUnderCd = Strain;
guidata(hObject, handles);


function Import_Path_Cd_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Path_Cd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Import_Path_Cd as text
%        str2double(get(hObject,'String')) returns contents of Import_Path_Cd as a double


% --- Executes during object creation, after setting all properties.
function Import_Path_Cd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Import_Path_Cd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Import_Pb.
function Import_Pb_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Data Import
[filename, filepath] = uigetfile({'*.xlsx'; '*.xls'}, 'Select Data');
Vfile = [filepath, filename];
format shortG
[RawData] = xlsread(Vfile);
set(handles.Import_Path_Pb, 'String', Vfile)

%% Data Processing
s = size(RawData);
CycleNo = ( (s(1)-46)-3+1 ) / 2;

% RawData(46,1) = 0
RawData_OD = RawData(46:(46+CycleNo-1) , : );
RawData_GFP = RawData((46+CycleNo+3):s , : );

Temp = RawData_OD(:,2);
for t = 1:length(Temp)
    if Temp(t) >= 37
        ToBeMinus = t;
        break
    end
end

Standard_OD = RawData_OD - RawData_OD(ToBeMinus,:);
Standard_GFP = (RawData_GFP - RawData_GFP(ToBeMinus,:)) ./ Standard_OD; % fluorescence(GFP) per cell(OD)

time_OD = RawData_OD(:,1)/3600; % sec -> hr
time_GFP = RawData_GFP(:,1)/3600; % sec -> hr

Strain = struct('OD',{ Standard_OD(:,[4:6 15:26 ]),...
                       Standard_OD(:,[7:9 27:38 ]),...
                       Standard_OD(:,[10:12 39:50 ]),...
                       Standard_OD(:,[88:90 51:62 ]),...
                       Standard_OD(:,[91:93 63:74 ]),...
                       Standard_OD(:,[94:96 75:86 ]) },...
               'GFP',{ Standard_GFP(:,[4:6 15:26 ]),...
                       Standard_GFP(:,[7:9 27:38 ]),...
                       Standard_GFP(:,[10:12 39:50 ]),...
                       Standard_GFP(:,[88:90 51:62 ]),...
                       Standard_GFP(:,[91:93 63:74 ]),...
                       Standard_GFP(:,[94:96 75:86 ]) } ,...
               'time',{time_OD, time_GFP, 0, 0, 0, 0} );
handles.StrainUnderPb = Strain;
guidata(hObject, handles);


function Import_Path_Pb_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Path_Pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Import_Path_Pb as text
%        str2double(get(hObject,'String')) returns contents of Import_Path_Pb as a double


% --- Executes during object creation, after setting all properties.
function Import_Path_Pb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Import_Path_Pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Import_Hg.
function Import_Hg_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Hg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Data Import
[filename, filepath] = uigetfile({'*.xlsx'; '*.xls'}, 'Select Data');
Vfile = [filepath, filename];
format shortG
[RawData] = xlsread(Vfile);
set(handles.Import_Path_Hg, 'String', Vfile)

%% Data Processing
s = size(RawData);
CycleNo = ( (s(1)-46)-3+1 ) / 2;

% RawData(46,1) = 0
RawData_OD = RawData(46:(46+CycleNo-1) , : );
RawData_GFP = RawData((46+CycleNo+3):s , : );

Temp = RawData_OD(:,2);
for t = 1:length(Temp)
    if Temp(t) >= 37
        ToBeMinus = t;
        break
    end
end

Standard_OD = RawData_OD - RawData_OD(ToBeMinus,:);
Standard_GFP = (RawData_GFP - RawData_GFP(ToBeMinus,:)) ./ Standard_OD; % fluorescence(GFP) per cell(OD)

time_OD = RawData_OD(:,1)/3600; % sec -> hr
time_GFP = RawData_GFP(:,1)/3600; % sec -> hr

Strain = struct('OD',{ Standard_OD(:,[4:6 15:26 ]),...
                       Standard_OD(:,[7:9 27:38 ]),...
                       Standard_OD(:,[10:12 39:50 ]),...
                       Standard_OD(:,[88:90 51:62 ]),...
                       Standard_OD(:,[91:93 63:74 ]),...
                       Standard_OD(:,[94:96 75:86 ]) },...
               'GFP',{ Standard_GFP(:,[4:6 15:26 ]),...
                       Standard_GFP(:,[7:9 27:38 ]),...
                       Standard_GFP(:,[10:12 39:50 ]),...
                       Standard_GFP(:,[88:90 51:62 ]),...
                       Standard_GFP(:,[91:93 63:74 ]),...
                       Standard_GFP(:,[94:96 75:86 ]) } ,...
               'time',{time_OD, time_GFP, 0, 0, 0, 0} );
handles.StrainUnderHg = Strain;
guidata(hObject, handles);


function Import_Path_Hg_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Path_Hg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Import_Path_Hg as text
%        str2double(get(hObject,'String')) returns contents of Import_Path_Hg as a double


% --- Executes during object creation, after setting all properties.
function Import_Path_Hg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Import_Path_Hg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Import_Zn.
function Import_Zn_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Zn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Data Import
[filename, filepath] = uigetfile({'*.xlsx'; '*.xls'}, 'Select Data');
Vfile = [filepath, filename];
format shortG
[RawData] = xlsread(Vfile);
set(handles.Import_Path_Zn, 'String', Vfile)

%% Data Processing
s = size(RawData);
CycleNo = ( (s(1)-46)-3+1 ) / 2;

% RawData(46,1) = 0
RawData_OD = RawData(46:(46+CycleNo-1) , : );
RawData_GFP = RawData((46+CycleNo+3):s , : );

Temp = RawData_OD(:,2);
for t = 1:length(Temp)
    if Temp(t) >= 37
        ToBeMinus = t;
        break
    end
end

Standard_OD = RawData_OD - RawData_OD(ToBeMinus,:);
Standard_GFP = (RawData_GFP - RawData_GFP(ToBeMinus,:)) ./ Standard_OD; % fluorescence(GFP) per cell(OD)

time_OD = RawData_OD(:,1)/3600; % sec -> hr
time_GFP = RawData_GFP(:,1)/3600; % sec -> hr

Strain = struct('OD',{ Standard_OD(:,[4:6 15:26 ]),...
                       Standard_OD(:,[7:9 27:38 ]),...
                       Standard_OD(:,[10:12 39:50 ]),...
                       Standard_OD(:,[88:90 51:62 ]),...
                       Standard_OD(:,[91:93 63:74 ]),...
                       Standard_OD(:,[94:96 75:86 ]) },...
               'GFP',{ Standard_GFP(:,[4:6 15:26 ]),...
                       Standard_GFP(:,[7:9 27:38 ]),...
                       Standard_GFP(:,[10:12 39:50 ]),...
                       Standard_GFP(:,[88:90 51:62 ]),...
                       Standard_GFP(:,[91:93 63:74 ]),...
                       Standard_GFP(:,[94:96 75:86 ]) } ,...
               'time',{time_OD, time_GFP, 0, 0, 0, 0} );
handles.StrainUnderZn = Strain;
guidata(hObject, handles);


function Import_Path_Zn_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Path_Zn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Import_Path_Zn as text
%        str2double(get(hObject,'String')) returns contents of Import_Path_Zn as a double


% --- Executes during object creation, after setting all properties.
function Import_Path_Zn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Import_Path_Zn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Import_Co.
function Import_Co_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Co (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Data Import
[filename, filepath] = uigetfile({'*.xlsx'; '*.xls'}, 'Select Data');
Vfile = [filepath, filename];
format shortG
[RawData] = xlsread(Vfile);
set(handles.Import_Path_Co, 'String', Vfile)

%% Data Processing
s = size(RawData);
CycleNo = ( (s(1)-46)-3+1 ) / 2;

% RawData(46,1) = 0
RawData_OD = RawData(46:(46+CycleNo-1) , : );
RawData_GFP = RawData((46+CycleNo+3):s , : );

Temp = RawData_OD(:,2);
for t = 1:length(Temp)
    if Temp(t) >= 37
        ToBeMinus = t;
        break
    end
end

Standard_OD = RawData_OD - RawData_OD(ToBeMinus,:);
Standard_GFP = (RawData_GFP - RawData_GFP(ToBeMinus,:)) ./ Standard_OD; % fluorescence(GFP) per cell(OD)

time_OD = RawData_OD(:,1)/3600; % sec -> hr
time_GFP = RawData_GFP(:,1)/3600; % sec -> hr

Strain = struct('OD',{ Standard_OD(:,[4:6 15:26 ]),...
                       Standard_OD(:,[7:9 27:38 ]),...
                       Standard_OD(:,[10:12 39:50 ]),...
                       Standard_OD(:,[88:90 51:62 ]),...
                       Standard_OD(:,[91:93 63:74 ]),...
                       Standard_OD(:,[94:96 75:86 ]) },...
               'GFP',{ Standard_GFP(:,[4:6 15:26 ]),...
                       Standard_GFP(:,[7:9 27:38 ]),...
                       Standard_GFP(:,[10:12 39:50 ]),...
                       Standard_GFP(:,[88:90 51:62 ]),...
                       Standard_GFP(:,[91:93 63:74 ]),...
                       Standard_GFP(:,[94:96 75:86 ]) } ,...
               'time',{time_OD, time_GFP, 0, 0, 0, 0} );
handles.StrainUnderCo = Strain;
guidata(hObject, handles);


function Import_Path_Co_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Path_Co (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Import_Path_Co as text
%        str2double(get(hObject,'String')) returns contents of Import_Path_Co as a double


% --- Executes during object creation, after setting all properties.
function Import_Path_Co_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Import_Path_Co (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Import_Ni.
function Import_Ni_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Ni (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% Data Import
[filename, filepath] = uigetfile({'*.xlsx'; '*.xls'}, 'Select Data');
Vfile = [filepath, filename];
format shortG
[RawData] = xlsread(Vfile);
set(handles.Import_Path_Ni, 'String', Vfile)

%% Data Processing
s = size(RawData);
CycleNo = ( (s(1)-46)-3+1 ) / 2;

% RawData(46,1) = 0
RawData_OD = RawData(46:(46+CycleNo-1) , : );
RawData_GFP = RawData((46+CycleNo+3):s , : );

Temp = RawData_OD(:,2);
for t = 1:length(Temp)
    if Temp(t) >= 37
        ToBeMinus = t;
        break
    end
end

Standard_OD = RawData_OD - RawData_OD(ToBeMinus,:);
Standard_GFP = (RawData_GFP - RawData_GFP(ToBeMinus,:)) ./ Standard_OD; % fluorescence(GFP) per cell(OD)

time_OD = RawData_OD(:,1)/3600; % sec -> hr
time_GFP = RawData_GFP(:,1)/3600; % sec -> hr

Strain = struct('OD',{ Standard_OD(:,[4:6 15:26 ]),...
                       Standard_OD(:,[7:9 27:38 ]),...
                       Standard_OD(:,[10:12 39:50 ]),...
                       Standard_OD(:,[88:90 51:62 ]),...
                       Standard_OD(:,[91:93 63:74 ]),...
                       Standard_OD(:,[94:96 75:86 ]) },...
               'GFP',{ Standard_GFP(:,[4:6 15:26 ]),...
                       Standard_GFP(:,[7:9 27:38 ]),...
                       Standard_GFP(:,[10:12 39:50 ]),...
                       Standard_GFP(:,[88:90 51:62 ]),...
                       Standard_GFP(:,[91:93 63:74 ]),...
                       Standard_GFP(:,[94:96 75:86 ]) } ,...
               'time',{time_OD, time_GFP, 0, 0, 0, 0} );
handles.StrainUnderNi = Strain;
guidata(hObject, handles);


function Import_Path_Ni_Callback(hObject, eventdata, handles)
% hObject    handle to Import_Path_Ni (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Import_Path_Ni as text
%        str2double(get(hObject,'String')) returns contents of Import_Path_Ni as a double


% --- Executes during object creation, after setting all properties.
function Import_Path_Ni_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Import_Path_Ni (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%% 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in Finish.
function Finish_Callback(hObject, eventdata, handles)
% hObject    handle to Finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = {handles.StrainUnderCd, handles.StrainUnderPb, handles.StrainUnderHg, ...
                  handles.StrainUnderZn, handles.StrainUnderCo, handles.StrainUnderNi, ...
                  handles.Conc_Cd.Value, handles.Conc_Pb.Value, handles.Conc_Hg.Value, ...
                  handles.Conc_Zn.Value, handles.Conc_Co.Value, handles.Conc_Ni.Value};

guidata(hObject, handles);
% 讓handles數據傳送至varargout
uiresume(handles.final_import_Tag);
