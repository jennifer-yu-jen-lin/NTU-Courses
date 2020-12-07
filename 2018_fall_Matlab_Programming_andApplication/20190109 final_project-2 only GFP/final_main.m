function varargout = final_main(varargin)
% FINAL_MAIN MATLAB code for final_main.fig
%      FINAL_MAIN, by itself, creates a new FINAL_MAIN or raises the existing
%      singleton*.
%
%      H = FINAL_MAIN returns the handle to a new FINAL_MAIN or the handle to
%      the existing singleton*.
%
%      FINAL_MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_MAIN.M with the given input arguments.
%
%      FINAL_MAIN('Property','Value',...) creates a new FINAL_MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final_main

% Last Modified by GUIDE v2.5 08-Jan-2019 21:40:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_main_OpeningFcn, ...
                   'gui_OutputFcn',  @final_main_OutputFcn, ...
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


% --- Executes just before final_main is made visible.
function final_main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final_main (see VARARGIN)

% Choose default command line output for final_main
handles.output = hObject;

%% disable bottoms -> need to import data first
% part 2 - disable bottoms
set( handles.Name_Strain1,      'Enable', 'off')
set( handles.Name_Strain2,      'Enable', 'off')
set( handles.Name_Strain3,      'Enable', 'off')
set( handles.Name_Strain4,      'Enable', 'off')
set( handles.Name_Strain5,      'Enable', 'off')
set( handles.Name_Strain6,      'Enable', 'off')
set( handles.Clear_Name,        'Enable', 'off')
set( handles.OK_Name,           'Enable', 'off')
% part 4 - disable bottoms
set( handles.View_Strain1,      'Enable', 'off')
set( handles.View_Strain2,      'Enable', 'off')
set( handles.View_Strain3,      'Enable', 'off')
set( handles.View_Strain4,      'Enable', 'off')
set( handles.View_Strain5,      'Enable', 'off')
set( handles.View_Strain6,      'Enable', 'off')
set( handles.View_Strain6,      'Enable', 'off')
set( handles.Clear_Plot,        'Enable', 'off')
% part 5 - disable bottoms
set( handles.Save_Strain1,      'Enable', 'off')
set( handles.Save_Strain2,      'Enable', 'off')
set( handles.Save_Strain3,      'Enable', 'off')
set( handles.Save_Strain4,      'Enable', 'off')
set( handles.Save_Strain5,      'Enable', 'off')
set( handles.Save_Strain6,      'Enable', 'off')
%% invisible popupmenus
% part 3 - invisible popupmenus
set(handles.Metal_Strain1,      'Visible', 'off')
set(handles.Metal_Strain2,      'Visible', 'off')
set(handles.Metal_Strain3,      'Visible', 'off')
set(handles.Metal_Strain4,      'Visible', 'off')
set(handles.Metal_Strain5,      'Visible', 'off')
set(handles.Metal_Strain6,      'Visible', 'off')

%% Color Spectrum
cBaseline = [0 0 0]/255;
c125uM = [241 123 121]/255;
c25uM = [199 57 38]/255;
c5uM = [203 187 40]/255;
c1uM = [104 212 15]/255;
c0_2uM = [82 197 223]/255;
c0_04uM = [43 133 196]/255;
c0_008uM = [19 54 192]/255;

colorspec = {...
    cBaseline; cBaseline; cBaseline; ...
    c0_008uM; c0_008uM; c0_008uM; ...
    c0_04uM; c0_04uM; c0_04uM; ...
    c0_2uM; c0_2uM; c0_2uM; ...
    c1uM; c1uM; c1uM; ...
    c5uM; c5uM; c5uM; ...
    c25uM; c25uM; c25uM; ...
    c125uM; c125uM; c125uM };

handles.colorspec_125 = colorspec([1:3 13:24], 1);
handles.colorspec_25 = colorspec([1:3 10:21], 1);
handles.colorspec_5 = colorspec([1:3 7:18], 1);
handles.colorspec_1 = colorspec([1:3 4:15], 1);

% Edit the Font Size
handles.FontSizeValue = 20;
handles.TickFontSizeValue = 12;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final_main wait for user response (see UIRESUME)
% uiwait(handles.final_main_Tag);


% --- Outputs from this function are returned to the command line.
function varargout = final_main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%% 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in ImportAllData.
function ImportAllData_Callback(hObject, eventdata, handles)
% hObject    handle to ImportAllData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 使用 final_import (另外一個GUI,像function一樣開啟它), 
% 將在另一個 GUI(final_import) 得到的資料存為：Data_from_final_import
% varargout = final_import(varargin)
handles.Data_from_final_import = final_import();
% part 2 - enable bottoms
set( handles.Name_Strain1,      'Enable', 'on')
set( handles.Name_Strain2,      'Enable', 'on')
set( handles.Name_Strain3,      'Enable', 'on')
set( handles.Name_Strain4,      'Enable', 'on')
set( handles.Name_Strain5,      'Enable', 'on')
set( handles.Name_Strain6,      'Enable', 'on')
set( handles.Clear_Name,        'Enable', 'on')
set( handles.OK_Name,           'Enable', 'on')
guidata(hObject, handles);


%%% 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Name_Strain1_Callback(hObject, eventdata, handles)
% hObject    handle to Name_Strain1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Name_Strain1 as text
%        str2double(get(hObject,'String')) returns contents of Name_Strain1 as a double
handles.N1 = get(handles.Name_Strain1, 'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Name_Strain1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Name_Strain1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Name_Strain2_Callback(hObject, eventdata, handles)
% hObject    handle to Name_Strain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Name_Strain2 as text
%        str2double(get(hObject,'String')) returns contents of Name_Strain2 as a double
handles.N2 = get(handles.Name_Strain2, 'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Name_Strain2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Name_Strain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Name_Strain3_Callback(hObject, eventdata, handles)
% hObject    handle to Name_Strain3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Name_Strain3 as text
%        str2double(get(hObject,'String')) returns contents of Name_Strain3 as a double
handles.N3 = get(handles.Name_Strain3, 'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Name_Strain3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Name_Strain3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Name_Strain4_Callback(hObject, eventdata, handles)
% hObject    handle to Name_Strain4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Name_Strain4 as text
%        str2double(get(hObject,'String')) returns contents of Name_Strain4 as a double
handles.N4 = get(handles.Name_Strain4, 'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Name_Strain4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Name_Strain4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Name_Strain5_Callback(hObject, eventdata, handles)
% hObject    handle to Name_Strain5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Name_Strain5 as text
%        str2double(get(hObject,'String')) returns contents of Name_Strain5 as a double
handles.N5 = get(handles.Name_Strain5, 'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Name_Strain5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Name_Strain5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Name_Strain6_Callback(hObject, eventdata, handles)
% hObject    handle to Name_Strain6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Name_Strain6 as text
%        str2double(get(hObject,'String')) returns contents of Name_Strain6 as a double
handles.N6 = get(handles.Name_Strain6, 'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Name_Strain6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Name_Strain6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Clear_Name.
function Clear_Name_Callback(hObject, eventdata, handles)
% hObject    handle to Clear_Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Name_Strain1, 'String', '');
set(handles.Name_Strain2, 'String', '');
set(handles.Name_Strain3, 'String', '');
set(handles.Name_Strain4, 'String', '');
set(handles.Name_Strain5, 'String', '');
set(handles.Name_Strain6, 'String', '');
handles.title_6plots = {}; % clear previous settings
% part 3 - invisible popupmenus
set(handles.Metal_Strain1,      'Visible', 'off')
set(handles.Metal_Strain2,      'Visible', 'off')
set(handles.Metal_Strain3,      'Visible', 'off')
set(handles.Metal_Strain4,      'Visible', 'off')
set(handles.Metal_Strain5,      'Visible', 'off')
set(handles.Metal_Strain6,      'Visible', 'off')
% part 4 - disenable bottoms
set( handles.View_Strain1,      'Enable', 'off')
set( handles.View_Strain2,      'Enable', 'off')
set( handles.View_Strain3,      'Enable', 'off')
set( handles.View_Strain4,      'Enable', 'off')
set( handles.View_Strain5,      'Enable', 'off')
set( handles.View_Strain6,      'Enable', 'off')
set( handles.Clear_Plot,        'Enable', 'off')
% part 5 - disenable bottoms
set( handles.Save_Strain1,      'Enable', 'off')
set( handles.Save_Strain2,      'Enable', 'off')
set( handles.Save_Strain3,      'Enable', 'off')
set( handles.Save_Strain4,      'Enable', 'off')
set( handles.Save_Strain5,      'Enable', 'off')
set( handles.Save_Strain6,      'Enable', 'off')

cla(handles.PlotGFP,'reset')
set(handles.PlotTitle,'String', '')

guidata(hObject, handles);

% --- Executes on button press in OK_Name.
function OK_Name_Callback(hObject, eventdata, handles)
% hObject    handle to OK_Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.title_6plots = {handles.N1, handles.N2, handles.N3, handles.N4, handles.N5, handles.N6};
% part 3 - visible popupmenus
set(handles.Metal_Strain1,      'Visible', 'on')
set(handles.Metal_Strain2,      'Visible', 'on')
set(handles.Metal_Strain3,      'Visible', 'on')
set(handles.Metal_Strain4,      'Visible', 'on')
set(handles.Metal_Strain5,      'Visible', 'on')
set(handles.Metal_Strain6,      'Visible', 'on')
% part 4 - enable bottoms
set( handles.View_Strain1,      'Enable', 'on')
set( handles.View_Strain2,      'Enable', 'on')
set( handles.View_Strain3,      'Enable', 'on')
set( handles.View_Strain4,      'Enable', 'on')
set( handles.View_Strain5,      'Enable', 'on')
set( handles.View_Strain6,      'Enable', 'on')
set( handles.Clear_Plot,        'Enable', 'on')

guidata(hObject, handles);

%%% 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in Metal_Strain1.
function Metal_Strain1_Callback(hObject, eventdata, handles)
% hObject    handle to Metal_Strain1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Metal_Strain1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Metal_Strain1


% --- Executes during object creation, after setting all properties.
function Metal_Strain1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Metal_Strain1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Metal_Strain2.
function Metal_Strain2_Callback(hObject, eventdata, handles)
% hObject    handle to Metal_Strain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Metal_Strain2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Metal_Strain2


% --- Executes during object creation, after setting all properties.
function Metal_Strain2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Metal_Strain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Metal_Strain3.
function Metal_Strain3_Callback(hObject, eventdata, handles)
% hObject    handle to Metal_Strain3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Metal_Strain3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Metal_Strain3


% --- Executes during object creation, after setting all properties.
function Metal_Strain3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Metal_Strain3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Metal_Strain4.
function Metal_Strain4_Callback(hObject, eventdata, handles)
% hObject    handle to Metal_Strain4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Metal_Strain4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Metal_Strain4


% --- Executes during object creation, after setting all properties.
function Metal_Strain4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Metal_Strain4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Metal_Strain5.
function Metal_Strain5_Callback(hObject, eventdata, handles)
% hObject    handle to Metal_Strain5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Metal_Strain5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Metal_Strain5


% --- Executes during object creation, after setting all properties.
function Metal_Strain5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Metal_Strain5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Metal_Strain6.
function Metal_Strain6_Callback(hObject, eventdata, handles)
% hObject    handle to Metal_Strain6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Metal_Strain6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Metal_Strain6


% --- Executes during object creation, after setting all properties.
function Metal_Strain6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Metal_Strain6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%% 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function PlotTitle_Callback(hObject, eventdata, handles)
% hObject    handle to PlotTitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PlotTitle as text
%        str2double(get(hObject,'String')) returns contents of PlotTitle as a double


% --- Executes during object creation, after setting all properties.
function PlotTitle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlotTitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in View_Strain1.
function View_Strain1_Callback(hObject, eventdata, handles)
% hObject    handle to View_Strain1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% part 5 - disable other Save bottoms, only enable the one Save buttom
set( handles.Save_Strain1,      'Enable', 'on')
set( handles.Save_Strain2,      'Enable', 'off')
set( handles.Save_Strain3,      'Enable', 'off')
set( handles.Save_Strain4,      'Enable', 'off')
set( handles.Save_Strain5,      'Enable', 'off')
set( handles.Save_Strain6,      'Enable', 'off')

%% Decide which processed excel data is going to be used
if handles.Metal_Strain1.Value == 1
    PlotData = handles.Data_from_final_import{1}; % = handles.StrainUnderCd in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{7} = handles.Conc_Cd.Value in final_import.m
    if handles.Data_from_final_import{7} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{7} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{7} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{7} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain1.Value == 2
    PlotData = handles.Data_from_final_import{2}; % = handles.StrainUnderPb in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{8} = handles.Conc_Pb.Value in final_import.m
    if handles.Data_from_final_import{8} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{8} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{8} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{8} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain1.Value == 3
    PlotData = handles.Data_from_final_import{3}; % = handles.StrainUnderHg in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{9} = handles.Conc_Hg.Value in final_import.m
    if handles.Data_from_final_import{9} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{9} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{9} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{9} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain1.Value == 4
    PlotData = handles.Data_from_final_import{4}; % = handles.StrainUnderZn in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{10} = handles.Conc_Zn.Value in final_import.m
    if handles.Data_from_final_import{10} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{10} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{10} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{10} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain1.Value == 5
    PlotData = handles.Data_from_final_import{5}; % = handles.StrainUnderCo in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{11} = handles.Conc_Co.Value in final_import.m
    if handles.Data_from_final_import{11} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{11} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{11} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{11} == 4
        color_plots = handles.colorspec_125 ;
    end   
else % handles.Metal_Strain1.Value == 6
    PlotData = handles.Data_from_final_import{6}; % = handles.StrainUnderNi in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{12} = handles.Conc_Ni.Value in final_import.m
    if handles.Data_from_final_import{12} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{12} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{12} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{12} == 4
        color_plots = handles.colorspec_125 ;
    end   
end

%% Plot 1
PlotNum = 1; % only need to edit this line
set(handles.PlotTitle,'String',handles.title_6plots{PlotNum})
time_GFP = PlotData(2).time;

% GFP
for i = 1:15
  plot(handles.PlotGFP, time_GFP, PlotData(PlotNum).GFP(:, i), 'Color', color_plots{i}, 'LineWidth', 1)
  set(handles.PlotGFP, 'XLim', [0 14]);
  set(handles.PlotGFP, 'YLim', [0 200000]);
  hold on
end
set(handles.PlotGFP, 'XTick', 0:2:14, 'YTick', 0:50000:200000)
hold off    


% --- Executes on button press in View_Strain2.
function View_Strain2_Callback(hObject, eventdata, handles)
% hObject    handle to View_Strain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% part 5 - disable other Save bottoms, only enable the one Save buttom
set( handles.Save_Strain1,      'Enable', 'off')
set( handles.Save_Strain2,      'Enable', 'on')
set( handles.Save_Strain3,      'Enable', 'off')
set( handles.Save_Strain4,      'Enable', 'off')
set( handles.Save_Strain5,      'Enable', 'off')
set( handles.Save_Strain6,      'Enable', 'off')

%% Decide which processed excel data is going to be used
if handles.Metal_Strain2.Value == 1
    PlotData = handles.Data_from_final_import{1}; % = handles.StrainUnderCd in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{7} = handles.Conc_Cd.Value in final_import.m
    if handles.Data_from_final_import{7} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{7} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{7} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{7} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain2.Value == 2
    PlotData = handles.Data_from_final_import{2}; % = handles.StrainUnderPb in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{8} = handles.Conc_Pb.Value in final_import.m
    if handles.Data_from_final_import{8} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{8} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{8} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{8} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain2.Value == 3
    PlotData = handles.Data_from_final_import{3}; % = handles.StrainUnderHg in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{9} = handles.Conc_Hg.Value in final_import.m
    if handles.Data_from_final_import{9} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{9} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{9} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{9} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain2.Value == 4
    PlotData = handles.Data_from_final_import{4}; % = handles.StrainUnderZn in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{10} = handles.Conc_Zn.Value in final_import.m
    if handles.Data_from_final_import{10} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{10} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{10} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{10} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain2.Value == 5
    PlotData = handles.Data_from_final_import{5}; % = handles.StrainUnderCo in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{11} = handles.Conc_Co.Value in final_import.m
    if handles.Data_from_final_import{11} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{11} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{11} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{11} == 4
        color_plots = handles.colorspec_125 ;
    end   
else % handles.Metal_Strain2.Value == 6
    PlotData = handles.Data_from_final_import{6}; % = handles.StrainUnderNi in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{12} = handles.Conc_Ni.Value in final_import.m
    if handles.Data_from_final_import{12} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{12} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{12} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{12} == 4
        color_plots = handles.colorspec_125 ;
    end   
end

%% Plot 2
PlotNum = 2; % only need to edit this line
set(handles.PlotTitle,'String',handles.title_6plots{PlotNum})
time_GFP = PlotData(2).time;

% GFP
for i = 1:15
  plot(handles.PlotGFP, time_GFP, PlotData(PlotNum).GFP(:, i), 'Color', color_plots{i}, 'LineWidth', 1)
  set(handles.PlotGFP, 'XLim', [0 14]);
  set(handles.PlotGFP, 'YLim', [0 200000]);
  hold on
end
set(handles.PlotGFP, 'XTick', 0:2:14, 'YTick', 0:50000:200000)
hold off  

% --- Executes on button press in View_Strain3.
function View_Strain3_Callback(hObject, eventdata, handles)
% hObject    handle to View_Strain3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% part 5 - disable other Save bottoms, only enable the one Save buttom
set( handles.Save_Strain1,      'Enable', 'off')
set( handles.Save_Strain2,      'Enable', 'off')
set( handles.Save_Strain3,      'Enable', 'on')
set( handles.Save_Strain4,      'Enable', 'off')
set( handles.Save_Strain5,      'Enable', 'off')
set( handles.Save_Strain6,      'Enable', 'off')

%% Decide which processed excel data is going to be used
if handles.Metal_Strain3.Value == 1
    PlotData = handles.Data_from_final_import{1}; % = handles.StrainUnderCd in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{7} = handles.Conc_Cd.Value in final_import.m
    if handles.Data_from_final_import{7} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{7} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{7} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{7} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain3.Value == 2
    PlotData = handles.Data_from_final_import{2}; % = handles.StrainUnderPb in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{8} = handles.Conc_Pb.Value in final_import.m
    if handles.Data_from_final_import{8} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{8} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{8} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{8} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain3.Value == 3
    PlotData = handles.Data_from_final_import{3}; % = handles.StrainUnderHg in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{9} = handles.Conc_Hg.Value in final_import.m
    if handles.Data_from_final_import{9} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{9} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{9} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{9} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain3.Value == 4
    PlotData = handles.Data_from_final_import{4}; % = handles.StrainUnderZn in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{10} = handles.Conc_Zn.Value in final_import.m
    if handles.Data_from_final_import{10} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{10} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{10} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{10} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain3.Value == 5
    PlotData = handles.Data_from_final_import{5}; % = handles.StrainUnderCo in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{11} = handles.Conc_Co.Value in final_import.m
    if handles.Data_from_final_import{11} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{11} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{11} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{11} == 4
        color_plots = handles.colorspec_125 ;
    end   
else % handles.Metal_Strain3.Value == 6
    PlotData = handles.Data_from_final_import{6}; % = handles.StrainUnderNi in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{12} = handles.Conc_Ni.Value in final_import.m
    if handles.Data_from_final_import{12} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{12} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{12} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{12} == 4
        color_plots = handles.colorspec_125 ;
    end   
end

%% Plot 3
PlotNum = 3; % only need to edit this line
set(handles.PlotTitle,'String',handles.title_6plots{PlotNum})
time_GFP = PlotData(2).time;

% GFP
for i = 1:15
  plot(handles.PlotGFP, time_GFP, PlotData(PlotNum).GFP(:, i), 'Color', color_plots{i}, 'LineWidth', 1)
  set(handles.PlotGFP, 'XLim', [0 14]);
  set(handles.PlotGFP, 'YLim', [0 200000]);
  hold on
end
set(handles.PlotGFP, 'XTick', 0:2:14, 'YTick', 0:50000:200000)
hold off  

% --- Executes on button press in View_Strain4.
function View_Strain4_Callback(hObject, eventdata, handles)
% hObject    handle to View_Strain4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% part 5 - disable other Save bottoms, only enable the one Save buttom
set( handles.Save_Strain1,      'Enable', 'off')
set( handles.Save_Strain2,      'Enable', 'off')
set( handles.Save_Strain3,      'Enable', 'off')
set( handles.Save_Strain4,      'Enable', 'on')
set( handles.Save_Strain5,      'Enable', 'off')
set( handles.Save_Strain6,      'Enable', 'off')

%% Decide which processed excel data is going to be used
if handles.Metal_Strain4.Value == 1
    PlotData = handles.Data_from_final_import{1}; % = handles.StrainUnderCd in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{7} = handles.Conc_Cd.Value in final_import.m
    if handles.Data_from_final_import{7} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{7} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{7} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{7} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain4.Value == 2
    PlotData = handles.Data_from_final_import{2}; % = handles.StrainUnderPb in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{8} = handles.Conc_Pb.Value in final_import.m
    if handles.Data_from_final_import{8} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{8} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{8} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{8} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain4.Value == 3
    PlotData = handles.Data_from_final_import{3}; % = handles.StrainUnderHg in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{9} = handles.Conc_Hg.Value in final_import.m
    if handles.Data_from_final_import{9} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{9} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{9} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{9} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain4.Value == 4
    PlotData = handles.Data_from_final_import{4}; % = handles.StrainUnderZn in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{10} = handles.Conc_Zn.Value in final_import.m
    if handles.Data_from_final_import{10} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{10} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{10} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{10} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain4.Value == 5
    PlotData = handles.Data_from_final_import{5}; % = handles.StrainUnderCo in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{11} = handles.Conc_Co.Value in final_import.m
    if handles.Data_from_final_import{11} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{11} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{11} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{11} == 4
        color_plots = handles.colorspec_125 ;
    end   
else % handles.Metal_Strain4.Value == 6
    PlotData = handles.Data_from_final_import{6}; % = handles.StrainUnderNi in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{12} = handles.Conc_Ni.Value in final_import.m
    if handles.Data_from_final_import{12} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{12} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{12} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{12} == 4
        color_plots = handles.colorspec_125 ;
    end   
end

%% Plot 4
PlotNum = 4; % only need to edit this line
set(handles.PlotTitle,'String',handles.title_6plots{PlotNum})
time_GFP = PlotData(2).time;

% GFP
for i = 1:15
  plot(handles.PlotGFP, time_GFP, PlotData(PlotNum).GFP(:, i), 'Color', color_plots{i}, 'LineWidth', 1)
  set(handles.PlotGFP, 'XLim', [0 14]);
  set(handles.PlotGFP, 'YLim', [0 200000]);
  hold on
end
set(handles.PlotGFP, 'XTick', 0:2:14, 'YTick', 0:50000:200000)
hold off  

% --- Executes on button press in View_Strain5.
function View_Strain5_Callback(hObject, eventdata, handles)
% hObject    handle to View_Strain5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% part 5 - disable other Save bottoms, only enable the one Save buttom
set( handles.Save_Strain1,      'Enable', 'off')
set( handles.Save_Strain2,      'Enable', 'off')
set( handles.Save_Strain3,      'Enable', 'off')
set( handles.Save_Strain4,      'Enable', 'off')
set( handles.Save_Strain5,      'Enable', 'on')
set( handles.Save_Strain6,      'Enable', 'off')

%% Decide which processed excel data is going to be used
if handles.Metal_Strain5.Value == 1
    PlotData = handles.Data_from_final_import{1}; % = handles.StrainUnderCd in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{7} = handles.Conc_Cd.Value in final_import.m
    if handles.Data_from_final_import{7} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{7} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{7} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{7} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain5.Value == 2
    PlotData = handles.Data_from_final_import{2}; % = handles.StrainUnderPb in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{8} = handles.Conc_Pb.Value in final_import.m
    if handles.Data_from_final_import{8} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{8} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{8} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{8} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain5.Value == 3
    PlotData = handles.Data_from_final_import{3}; % = handles.StrainUnderHg in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{9} = handles.Conc_Hg.Value in final_import.m
    if handles.Data_from_final_import{9} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{9} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{9} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{9} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain5.Value == 4
    PlotData = handles.Data_from_final_import{4}; % = handles.StrainUnderZn in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{10} = handles.Conc_Zn.Value in final_import.m
    if handles.Data_from_final_import{10} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{10} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{10} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{10} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain5.Value == 5
    PlotData = handles.Data_from_final_import{5}; % = handles.StrainUnderCo in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{11} = handles.Conc_Co.Value in final_import.m
    if handles.Data_from_final_import{11} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{11} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{11} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{11} == 4
        color_plots = handles.colorspec_125 ;
    end   
else % handles.Metal_Strain5.Value == 6
    PlotData = handles.Data_from_final_import{6}; % = handles.StrainUnderNi in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{12} = handles.Conc_Ni.Value in final_import.m
    if handles.Data_from_final_import{12} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{12} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{12} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{12} == 4
        color_plots = handles.colorspec_125 ;
    end   
end

%% Plot 5
PlotNum = 5; % only need to edit this line
set(handles.PlotTitle,'String',handles.title_6plots{PlotNum})
time_GFP = PlotData(2).time;

% GFP
for i = 1:15
  plot(handles.PlotGFP, time_GFP, PlotData(PlotNum).GFP(:, i), 'Color', color_plots{i}, 'LineWidth', 1)
  set(handles.PlotGFP, 'XLim', [0 14]);
  set(handles.PlotGFP, 'YLim', [0 200000]);
  hold on
end
set(handles.PlotGFP, 'XTick', 0:2:14, 'YTick', 0:50000:200000)
hold off  

% --- Executes on button press in View_Strain6.
function View_Strain6_Callback(hObject, eventdata, handles)
% hObject    handle to View_Strain6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% part 5 - disable other Save bottoms, only enable the one Save buttom
set( handles.Save_Strain1,      'Enable', 'off')
set( handles.Save_Strain2,      'Enable', 'off')
set( handles.Save_Strain3,      'Enable', 'off')
set( handles.Save_Strain4,      'Enable', 'off')
set( handles.Save_Strain5,      'Enable', 'off')
set( handles.Save_Strain6,      'Enable', 'on')

%% Decide which processed excel data is going to be used
if handles.Metal_Strain6.Value == 1
    PlotData = handles.Data_from_final_import{1}; % = handles.StrainUnderCd in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{7} = handles.Conc_Cd.Value in final_import.m
    if handles.Data_from_final_import{7} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{7} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{7} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{7} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain6.Value == 2
    PlotData = handles.Data_from_final_import{2}; % = handles.StrainUnderPb in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{8} = handles.Conc_Pb.Value in final_import.m
    if handles.Data_from_final_import{8} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{8} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{8} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{8} == 4
        color_plots = handles.colorspec_125 ;
    end   
elseif handles.Metal_Strain6.Value == 3
    PlotData = handles.Data_from_final_import{3}; % = handles.StrainUnderHg in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{9} = handles.Conc_Hg.Value in final_import.m
    if handles.Data_from_final_import{9} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{9} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{9} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{9} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain6.Value == 4
    PlotData = handles.Data_from_final_import{4}; % = handles.StrainUnderZn in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{10} = handles.Conc_Zn.Value in final_import.m
    if handles.Data_from_final_import{10} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{10} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{10} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{10} == 4
        color_plots = handles.colorspec_125 ;
    end
elseif handles.Metal_Strain6.Value == 5
    PlotData = handles.Data_from_final_import{5}; % = handles.StrainUnderCo in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{11} = handles.Conc_Co.Value in final_import.m
    if handles.Data_from_final_import{11} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{11} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{11} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{11} == 4
        color_plots = handles.colorspec_125 ;
    end   
else % handles.Metal_Strain6.Value == 6
    PlotData = handles.Data_from_final_import{6}; % = handles.StrainUnderNi in final_import.m
    %% Decide the color spectrum based on the input data from final_import
    % handles.Data_from_final_import{12} = handles.Conc_Ni.Value in final_import.m
    if handles.Data_from_final_import{12} == 1
        color_plots = handles.colorspec_1 ;
    elseif handles.Data_from_final_import{12} == 2
        color_plots = handles.colorspec_5 ;
    elseif handles.Data_from_final_import{12} == 3
        color_plots = handles.colorspec_25 ;
    else % handles.Data_from_final_import{12} == 4
        color_plots = handles.colorspec_125 ;
    end   
end

%% Plot 6
PlotNum = 6; % only need to edit this line
set(handles.PlotTitle,'String',handles.title_6plots{PlotNum})
time_GFP = PlotData(2).time;

% GFP
for i = 1:15
  plot(handles.PlotGFP, time_GFP, PlotData(PlotNum).GFP(:, i), 'Color', color_plots{i}, 'LineWidth', 1)
  set(handles.PlotGFP, 'XLim', [0 14]);
  set(handles.PlotGFP, 'YLim', [0 200000]);
  hold on
end
set(handles.PlotGFP, 'XTick', 0:2:14, 'YTick', 0:50000:200000)
hold off  

% --- Executes on button press in Clear_Plot.
function Clear_Plot_Callback(hObject, eventdata, handles)
% hObject    handle to Clear_Plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.PlotGFP,'reset')
set(handles.PlotTitle,'String', '')
% part 5 - disable other Save bottoms, only enable the one Save buttom
set( handles.Save_Strain1,      'Enable', 'off')
set( handles.Save_Strain2,      'Enable', 'off')
set( handles.Save_Strain3,      'Enable', 'off')
set( handles.Save_Strain4,      'Enable', 'off')
set( handles.Save_Strain5,      'Enable', 'off')
set( handles.Save_Strain6,      'Enable', 'off')

guidata(hObject, handles);




%%% 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in Save_Strain1.
function Save_Strain1_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Strain1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = 1; % strain 1
if handles.Metal_Strain1.Value == 1
    filename = [handles.title_6plots{s} '_Cd_GFP.png' ];
elseif handles.Metal_Strain1.Value == 2
    filename = [handles.title_6plots{s} '_Pb_GFP.png' ];
elseif handles.Metal_Strain1.Value == 3
    filename = [handles.title_6plots{s} '_Hg_GFP.png' ];
elseif handles.Metal_Strain1.Value == 4
    filename = [handles.title_6plots{s} '_Zn_GFP.png' ];
elseif handles.Metal_Strain1.Value == 5
    filename = [handles.title_6plots{s} '_Co_GFP.png' ];
else % handles.Metal_Strain1.Value == 6
    filename = [handles.title_6plots{s} '_Ni_GFP.png' ];
end
% save GFP plot
F = getframe(handles.PlotGFP);
Image = frame2im(F);
imwrite(Image, filename)

% --- Executes on button press in Save_Strain2.
function Save_Strain2_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Strain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = 2; % strain 2
if handles.Metal_Strain2.Value == 1
    filename = [handles.title_6plots{s} '_Cd_GFP.png' ];
elseif handles.Metal_Strain2.Value == 2
    filename = [handles.title_6plots{s} '_Pb_GFP.png' ];
elseif handles.Metal_Strain2.Value == 3
    filename = [handles.title_6plots{s} '_Hg_GFP.png' ];
elseif handles.Metal_Strain2.Value == 4
    filename = [handles.title_6plots{s} '_Zn_GFP.png' ];
elseif handles.Metal_Strain2.Value == 5
    filename = [handles.title_6plots{s} '_Co_GFP.png' ];
else % handles.Metal_Strain2.Value == 6
    filename = [handles.title_6plots{s} '_Ni_GFP.png' ];
end
% save GFP plot
F = getframe(handles.PlotGFP);
Image = frame2im(F);
imwrite(Image, filename)

% --- Executes on button press in Save_Strain3.
function Save_Strain3_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Strain3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = 3; % strain 3
if handles.Metal_Strain3.Value == 1
    filename = [handles.title_6plots{s} '_Cd_GFP.png' ];
elseif handles.Metal_Strain3.Value == 2
    filename = [handles.title_6plots{s} '_Pb_GFP.png' ];
elseif handles.Metal_Strain3.Value == 3
    filename = [handles.title_6plots{s} '_Hg_GFP.png' ];
elseif handles.Metal_Strain3.Value == 4
    filename = [handles.title_6plots{s} '_Zn_GFP.png' ];
elseif handles.Metal_Strain3.Value == 5
    filename = [handles.title_6plots{s} '_Co_GFP.png' ];
else % handles.Metal_Strain3.Value == 6
    filename = [handles.title_6plots{s} '_Ni_GFP.png' ];
end
% save GFP plot
F = getframe(handles.PlotGFP);
Image = frame2im(F);
imwrite(Image, filename)

% --- Executes on button press in Save_Strain4.
function Save_Strain4_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Strain4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = 4; % strain 4
if handles.Metal_Strain4.Value == 1
    filename = [handles.title_6plots{s} '_Cd_GFP.png' ];
elseif handles.Metal_Strain4.Value == 2
    filename = [handles.title_6plots{s} '_Pb_GFP.png' ];
elseif handles.Metal_Strain4.Value == 3
    filename = [handles.title_6plots{s} '_Hg_GFP.png' ];
elseif handles.Metal_Strain4.Value == 4
    filename = [handles.title_6plots{s} '_Zn_GFP.png' ];
elseif handles.Metal_Strain4.Value == 5
    filename = [handles.title_6plots{s} '_Co_GFP.png' ];
else % handles.Metal_Strain4.Value == 6
    filename = [handles.title_6plots{s} '_Ni_GFP.png' ];
end
% save GFP plot
F = getframe(handles.PlotGFP);
Image = frame2im(F);
imwrite(Image, filename)

% --- Executes on button press in Save_Strain5.
function Save_Strain5_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Strain5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = 5; % strain 5
if handles.Metal_Strain5.Value == 1
    filename = [handles.title_6plots{s} '_Cd_GFP.png' ];
elseif handles.Metal_Strain5.Value == 2
    filename = [handles.title_6plots{s} '_Pb_GFP.png' ];
elseif handles.Metal_Strain5.Value == 3
    filename = [handles.title_6plots{s} '_Hg_GFP.png' ];
elseif handles.Metal_Strain5.Value == 4
    filename = [handles.title_6plots{s} '_Zn_GFP.png' ];
elseif handles.Metal_Strain5.Value == 5
    filename = [handles.title_6plots{s} '_Co_GFP.png' ];
else % handles.Metal_Strain5.Value == 6
    filename = [handles.title_6plots{s} '_Ni_GFP.png' ];
end
% save GFP plot
F = getframe(handles.PlotGFP);
Image = frame2im(F);
imwrite(Image, filename)

% --- Executes on button press in Save_Strain6.
function Save_Strain6_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Strain6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = 6; % strain 6
if handles.Metal_Strain6.Value == 1
    filename = [handles.title_6plots{s} '_Cd_GFP.png' ];
elseif handles.Metal_Strain6.Value == 2
    filename = [handles.title_6plots{s} '_Pb_GFP.png' ];
elseif handles.Metal_Strain6.Value == 3
    filename = [handles.title_6plots{s} '_Hg_GFP.png' ];
elseif handles.Metal_Strain6.Value == 4
    filename = [handles.title_6plots{s} '_Zn_GFP.png' ];
elseif handles.Metal_Strain6.Value == 5
    filename = [handles.title_6plots{s} '_Co_GFP.png' ];
else % handles.Metal_Strain6.Value == 6
    filename = [handles.title_6plots{s} '_Ni_GFP.png' ];
end
% save GFP plot
F = getframe(handles.PlotGFP);
Image = frame2im(F);
imwrite(Image, filename)
