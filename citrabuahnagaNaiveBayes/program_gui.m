function varargout = program_gui(varargin)
% PROGRAM_GUI MATLAB code for program_gui.fig
%      PROGRAM_GUI, by itself, creates a new PROGRAM_GUI or raises the existing
%      singleton*.
%
%      H = PROGRAM_GUI returns the handle to a new PROGRAM_GUI or the handle to
%      the existing singleton*.
%
%      PROGRAM_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROGRAM_GUI.M with the given input arguments.
%
%      PROGRAM_GUI('Property','Value',...) creates a new PROGRAM_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before program_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to program_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help program_gui

% Last Modified by GUIDE v2.5 01-Jan-2022 11:02:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @program_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @program_gui_OutputFcn, ...
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


% --- Executes just before program_gui is made visible.
function program_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to program_gui (see VARARGIN)

movegui('center')

% Choose default command line output for program_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes program_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

ah = axes('unit','normalized','position',[0 0 1 1]);
bg = imread('images.jpg');
imagesc(bg);
set(ah,'handlevisibility','off','visible','off')


% --- Outputs from this function are returned to the command line.
function varargout = program_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
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

% memanggil menu "browse file"
[nama_file,nama_folder] = uigetfile('*.jpg');

% jika ada nama file yang dipilih maka akan mengeksekusi perintah dibawah
% ini
if ~isequal(nama_file,0)
    % membaca file citra rgb
    Img = im2double(imread(fullfile(nama_folder,nama_file)));
    % menampilkan citra rgb pada axes1
    axes(handles.axes1)
    imshow(Img)
    % menampilkan nama file pada edit text
    set(handles.edit1,'String',nama_file)
    % menyimpan variabel Img pada lokasi handles agar dapat dipanggil oleh
    % pushbutton lainnya
    handles.Img = Img;
    guidata(hObject, handles)
    
    % memanggil variabel Img yang ada di lokasi handles
    Img = handles.Img;

    % mengkonversi citra rgb menjadi citra grayscale
    Img_gray = rgb2gray(Img);
    %     figure, imshow(Img)
    %     figure, imshow(Img_gray)
    % mengkonversi citra grayscale menjadi citra biner
    bw = imbinarize(Img_gray,.9);
    %     figure, imshow(bw)
    % melakukan operasi komplemen
    bw = imcomplement(bw);
    %     figure, imshow(bw)
    % melakukan operasi morfologi untuk menyempurnakan hasil segmentasi
    % 1. filling holes
    bw = imfill(bw,'holes');
    %     figure, imshow(bw)
    % 2. area opening
    bw = bwareaopen(bw, 100);
    %     figure, imshow(bw)
    % ekstraksi warna rgb
    
    HSV = rgb2hsv(Img);
    
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
    
    H = HSV(:,:,1); % Hue
    S = HSV(:,:,2); % Saturation
    V = HSV(:,:,3); % Value
    
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
%     RGB = cat(3,R,G,B);
    %     figure, imshow(RGB)

    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
    
    Hue = sum(sum(H))/sum(sum(bw));
    Saturation = sum(sum(S))/sum(sum(bw));
    Value = sum(sum(V))/sum(sum(bw));

    % menyusun variabel ciri_uji
    ciri_uji = [Red,Green,Blue,Hue,Saturation,Value];

    % menampilkan ciri RGB pada edit text
    set(handles.edit3,'String',num2str(Red));
    set(handles.edit4,'String',num2str(Green));
    set(handles.edit5,'String',num2str(Blue));
    
    set(handles.edit6,'String',num2str(Hue));
    set(handles.edit7,'String',num2str(Saturation));
    set(handles.edit8,'String',num2str(Value));

    % menyimpan variabel ciri_uji pada lokasi handles agar dapat dipanggil oleh
    % pushbutton lainnya
    handles.ciri_uji = ciri_uji;
    guidata(hObject, handles)

    % memanggil variabel ciri_uji yang ada di lokasi handles
    ciri_uji = handles.ciri_uji;

    % memanggil model k-nn hasil pelatihan
    load Mdl

    % membaca kelas keluaran hasil pengujian
    hasil_uji = predict(Mdl, ciri_uji);

    % menampilkan kelas keluaran hasil pengujian pada edit text
    set(handles.edit2, 'String',hasil_uji{1})

    
    
else
    % jika tidak ada nama file yang dipilih maka akan kembali
    return
end

% --- Executes on button press in pushbutton5.
    function pushbutton5_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton5 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % mereset tampilan GUI
    set(handles.edit1,'String',[])
    set(handles.edit2,'String',[])
    set(handles.edit3,'String',[])
    set(handles.edit4,'String',[])
    set(handles.edit5,'String',[])
    set(handles.edit6,'String',[])
    set(handles.edit7,'String',[])
    set(handles.edit8,'String',[])
    

    axes(handles.axes1)
    cla reset
    set(gca,'XTick',[])
    set(gca,'YTick',[])

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% menyimpan variabel R,G,B dan bw pada lokasi handles agar dapat dipanggil
% oleh pushbutton lainnya
handles.R = R;
handles.G = G;
handles.B = B;
handles.bw = bw;
guidata(hObject, handles)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
