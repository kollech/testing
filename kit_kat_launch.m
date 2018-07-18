function varargout = kit_kat_launch(varargin)
% KIT_KAT_LAUNCH MATLAB code for kit_kat_launch.fig
%      KIT_KAT_LAUNCH, by itself, creates a new KIT_KAT_LAUNCH or raises the existing
%      singleton*.
%
%      H = KIT_KAT_LAUNCH returns the handle to a new KIT_KAT_LAUNCH or the handle to
%      the existing singleton*.
%
%      KIT_KAT_LAUNCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KIT_KAT_LAUNCH.M with the given input arguments.
%
%      KIT_KAT_LAUNCH('Property','Value',...) creates a new KIT_KAT_LAUNCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kit_kat_launch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kit_kat_launch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kit_kat_launch

% Last Modified by GUIDE v2.5 22-Feb-2018 11:28:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kit_kat_launch_OpeningFcn, ...
                   'gui_OutputFcn',  @kit_kat_launch_OutputFcn, ...
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


% --- Executes just before kit_kat_launch is made visible.
function kit_kat_launch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kit_kat_launch (see VARARGIN)

% Choose default command line output for kit_kat_launch
handles.output = hObject;
current_directory = pwd;
if ispc == 1
addpath([pwd,'\KIT']);
addpath([pwd,'\KAT']);
elseif ismac == 1
addpath([pwd,'/KIT']);
addpath([pwd,'/KAT']);    
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kit_kat_launch wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kit_kat_launch_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in launch_kit.
function launch_kit_Callback(hObject, eventdata, handles)
% hObject    handle to launch_kit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run frame_merger


% --- Executes on button press in launch_kat.
function launch_kat_Callback(hObject, eventdata, handles)
% hObject    handle to launch_kat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run KAT_2


% --- Executes on button press in set_work_dirc.
function set_work_dirc_Callback(hObject, eventdata, handles)
% hObject    handle to set_work_dirc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global working_directory
working_directory = uigetdir;
addpath(working_directory);
set(handles.work_dirc,'String',working_directory);


function work_dirc_Callback(hObject, eventdata, handles)
% hObject    handle to work_dirc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of work_dirc as text
%        str2double(get(hObject,'String')) returns contents of work_dirc as a double


% --- Executes during object creation, after setting all properties.
function work_dirc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to work_dirc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
