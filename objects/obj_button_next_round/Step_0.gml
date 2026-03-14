var cam = view_camera;
var cam_y = camera_get_view_y(cam);
var cam_w_half = camera_get_view_width(cam) / 2;
var cam_h_half = camera_get_view_height(cam) / 2;

x = cam_w_half;
y = cam_y + cam_h_half + 150;