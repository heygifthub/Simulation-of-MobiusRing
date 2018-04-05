function varargout = mobiwusi(varargin)
% MOBIWUSI MATLAB code for mobiwusi.fig
%      MOBIWUSI, by itself, creates a new MOBIWUSI or raises the existing
%      singleton*.
%
%      H = MOBIWUSI returns the handle to a new MOBIWUSI or the handle to
%      the existing singleton*.
%
%      MOBIWUSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOBIWUSI.M with the given input arguments.
%
%      MOBIWUSI('Property','Value',...) creates a new MOBIWUSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mobiwusi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mobiwusi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mobiwusi

% Last Modified by GUIDE v2.5 27-Feb-2017 16:54:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mobiwusi_OpeningFcn, ...
                   'gui_OutputFcn',  @mobiwusi_OutputFcn, ...
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



% --- Executes just before mobiwusi is made visible.
function mobiwusi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mobiwusi (see VARARGIN)

% Choose default command line output for mobiwusi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mobiwusi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mobiwusi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
II=imread('1.jpg');
image(II)
%colormap gray
set(ha,'handlevisibility','off','visible','off');
%I=imread('1.jpg');
%set(handles.pushbutton1,'cdata',I);
%set(handles.pushbutton2,'cdata',I);





function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%清除前一次所画图像
cla
%获取输入的数据
%n为等分次数
%m为扭转次数
n=str2num(get(handles.edit1,'String'));
m=str2num(get(handles.edit2,'String'));

%绘图部分，原理参照前面公式
r=2;w=1;
h=w/2;
l=0;c=n;
if mod(n,2)==1
    c=n+1;
end
for i=1:1:(c/2)
    %r=r+i;
    l=h-w/(2*n);
    s=[-h,-l];
    t=linspace(0,2*pi);
    [s,t]=meshgrid(s,t);
    x=(r+w.*s.*cos(t.*m/2)).*cos(t);
    y=(r+w.*s.*cos(t.*m/2)).*sin(t);
    z=w.*s.*sin(t.*m/2);
    surf(x,y,z);
   hold on
   s=[l,h];
   t=linspace(0,2*pi);
   [s,t]=meshgrid(s,t);
   x=(r+w.*s.*cos(t.*m/2)).*cos(t);
   y=(r+w.*s.*cos(t.*m/2)).*sin(t);
   z=w.*s.*sin(t.*m/2);
   surf(x,y,z);
   hold on
   h=l-w/(2*n);
end


shading interp; 
%消除坐标轴
axis off;
%关闭画图中的个网线 
grid off;
%相等刻度
axis equal;
%提供各种显示属性调节菜单
cameramenu;

%while 1
   % speed=get(handles.slider1,'Value');
   % i=i+speed;
    %view([方位角,俯视角])? ???通过方位角、俯视角设置视点
    %view([vx,vy,vz])? ???通过直角坐标设置视点
   %  view(i,i)
    %view(-45+1*(i-1),45)
   % g(:,i)=getframe;
%end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
