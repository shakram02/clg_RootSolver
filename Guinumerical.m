function varargout = Guinumerical(varargin)
% GUINUMERICAL M-file for Guinumerical.fig
%      GUINUMERICAL, by itself, creates a new GUINUMERICAL or raises the existing
%      singleton*.
%
%      H = GUINUMERICAL returns the handle to a new GUINUMERICAL or the handle to
%      the existing singleton*.
%
%      GUINUMERICAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUINUMERICAL.M with the given input arguments.
%
%      GUINUMERICAL('Property','Value',...) creates a new GUINUMERICAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Guinumerical_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Guinumerical_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Guinumerical

% Last Modified by GUIDE v2.5 14-Dec-2016 03:01:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Guinumerical_OpeningFcn, ...
                   'gui_OutputFcn',  @Guinumerical_OutputFcn, ...
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




% --- Executes just before Guinumerical is made visible.
function Guinumerical_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Guinumerical (see VARARGIN)
clc
% Choose default command line output for Guinumerical
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Guinumerical wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = Guinumerical_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function eqbox_Callback(hObject, eventdata, handles)
% hObject    handle to eqbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eqbox as text
%        str2double(get(hObject,'String')) returns contents of eqbox as a double

axes(handles.axes1);
func = get(handles.eqbox, 'String');
ezplot(func);

%f=inline(get(handles.eqbox,'String'));
%fplot(f,[-5 5]);

% --- Executes during object creation, after setting all properties.
function eqbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eqbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white'); 
end



% --- Executes on button press in Solveit.
function Solveit_Callback(hObject, eventdata, handles)
% hObject    handle to Solveit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num = get(handles.ButtonGroup, 'SelectedObject');
method = get(num,'String');
func = get(handles.eqbox, 'String');

xu = str2num(get(handles.xu, 'String')); 
xl = str2num(get(handles.xl, 'String')); 
xo = str2num(get(handles.xo, 'String')); 
xi = str2num(get(handles.xi, 'String')); 
xi2 = str2num(get(handles.xi2, 'String')); 
imax = str2num(get(handles.maxItr, 'String'));
error = str2num(get(handles.epsilon, 'String'));

switch method
    case'Bisection'
        
        [answer] = bisection(xl, xu, error, imax, func,handles);
%         sy=getfx(equation, xl):0.1:getfx(equation, xu);
    case'False Position'
        answer = false_position(xl, xu, error, imax, func, handles);
    case 'Fixed Point'
        answer = fixed_point(xo, error, imax, func, handles);
    case 'Newton Raphson'
        answer = newton_raphson(xo, error, imax, func, handles);
    case 'Secant'
        answer = secant(xo, xl, error, imax, func, handles);
    
end

set(handles.rootx, 'String', answer);

function FixedPointsetView(handles,showState)
set(handles.secantProps, 'Visible', showState);



function radiobisection_Callback(hObject, eventdata, handles)
function radiofixed_Callback(hObject, eventdata, handles)
function radiosecant_Callback(hObject, eventdata, handles)
function radionewton_Callback(hObject, eventdata, handles)
function radiofalse_Callback(hObject, eventdata, handles)
function xu_Callback(hObject, eventdata, handles)
function xu_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xl_Callback(hObject, eventdata, handles)
function xl_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xo_Callback(hObject, eventdata, handles)
function xo_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function xon_Callback(hObject, eventdata, handles)
function xon_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function xi_Callback(hObject, eventdata, handles)
function xi_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function xi2_Callback(hObject, eventdata, handles)
function xi2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function maxItr_Callback(hObject, eventdata, handles)
function maxItr_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function epsilon_Callback(hObject, eventdata, handles)
function epsilon_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function itrtaken_Callback(hObject, eventdata, handles)
function itrtaken_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% //----------------------------------------
function rootx_Callback(hObject, eventdata, handles)
function rootx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rootx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function extime_Callback(hObject, eventdata, handles)
function extime_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function presicion_Callback(hObject, eventdata, handles)
function presicion_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function ButtonGroup_CreateFcn(hObject, eventdata, handles)


