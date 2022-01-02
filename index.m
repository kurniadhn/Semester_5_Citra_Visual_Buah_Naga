function varargout = index(varargin)
% INDEX MATLAB code for index.fig
%      INDEX, by itself, creates a new INDEX or raises the existing
%      singleton*.
%
%      H = INDEX returns the handle to a new INDEX or the handle to
%      the existing singleton*.
%
%      INDEX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INDEX.M with the given input arguments.
%
%      INDEX('Property','Value',...) creates a new INDEX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before index_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to index_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help index

% Last Modified by GUIDE v2.5 02-Jan-2022 21:06:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @index_OpeningFcn, ...
                   'gui_OutputFcn',  @index_OutputFcn, ...
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


% --- Executes just before index is made visible.
function index_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to index (see VARARGIN)

% Choose default command line output for index
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(hObject, 'center');

% UIWAIT makes index wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = index_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pilih_citra.
function pilih_citra_Callback(hObject, eventdata, handles)
% hObject    handle to pilih_citra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Image File
[nama_file, nama_folder] = uigetfile('*.jpg');

% Processing Image File
if ~isequal(nama_file, 0)
    % Reading Image File
    citra = im2double(imread(fullfile(nama_folder, nama_file)));
    handles.citra = citra;
    guidata(hObject, handles);
    
    % Menampilkan Nama File Image Pada Teks
    set(handles.nama_file, 'String', nama_file);
    
    % Menampilkan Citra Asli
    axes(handles.axes1);
    imshow(citra);
    
    % Menampilkan Citra Konversi Red
    red = citra(:, :, 1);
    rata_red = mean(mean(citra(:, :, 1)));
    axes(handles.axes2)
    imshow(red);
    set(handles.red, 'String', rata_red);
    
    % Menampilkan Citra Konversi Green
    green = citra(:, :, 2);
    rata_green = mean(mean(citra(:, :, 2)));
    axes(handles.axes3)
    imshow(green);
    set(handles.green, 'String', rata_green);
    
    % Menampilkan Citra Konversi Blue
    blue = citra(:, :, 3);
    rata_blue = mean(mean(citra(:, :, 3)));
    axes(handles.axes4)
    imshow(blue);
    set(handles.blue, 'String', rata_blue);
else
    return
end


% --- Executes on button press in ekstraksi_ciri.
function ekstraksi_ciri_Callback(hObject, eventdata, handles)
% hObject    handle to ekstraksi_ciri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

citra = handles.citra;

% Konversi Citra RGB Menjadi Citra Grayscale
citra_gray = rgb2gray(citra);

% Membaca Pixel Distance
distance = 1;
pixel_dist = str2double(distance);

% Membentuk Matriks Kookurensi
GLCM = graycomatrix(citra_gray, 'Offset', [0, pixel_dist;...
    -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);

% Mengekstrak Fitur GLCM
stats = graycoprops(GLCM, ['Contrast' 'Correlation']);

% Membaca Fitur GLCM
Contrast = stats.Contrast;
Correlation = stats.Correlation;

% Menampilkan Fitur GLCM Pada Edit Teks
g0_contrast = num2str(Contrast(1));
set(handles.hue, 'String', g0_contrast);

% --- Executes on button press in hasil_klasifikasi.
function hasil_klasifikasi_Callback(hObject, eventdata, handles)
% hObject    handle to hasil_klasifikasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1)
cla reset
set(gca, 'XTick', [])
set(gca, 'YTick', [])

axes(handles.axes2)
cla reset
set(gca, 'XTick', [])
set(gca, 'YTick', [])

axes(handles.axes3)
cla reset
set(gca, 'XTick', [])
set(gca, 'YTick', [])

axes(handles.axes4)
cla reset
set(gca, 'XTick', [])
set(gca, 'YTick', [])

set(handles.nama_file, 'String', [])
set(handles.red, 'String', [])
set(handles.green, 'String', [])
set(handles.blue, 'String', [])
set(handles.hue, 'String', [])
set(handles.saturation, 'String', [])
set(handles.g90_kontras, 'String', [])
set(handles.g135_kontras, 'String', [])
set(handles.value, 'String', [])
set(handles.g45_entropi, 'String', [])
set(handles.g90_entropi, 'String', [])
set(handles.g135_entropi, 'String', [])
