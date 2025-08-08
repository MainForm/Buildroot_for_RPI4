#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <stdbool.h>

#include "lvgl/lvgl.h"
#include "lvgl/demos/lv_demos.h"

const char *getenv_default(const char *name, const char *dflt)
{
    return getenv(name) ?: dflt;
}

lv_display_t * lv_linux_disp_init(void)
{
    const char *device = getenv_default("LV_LINUX_DRM_CARD", "/dev/dri/card1");
    lv_display_t *disp = lv_linux_drm_create();

    lv_linux_drm_set_file(disp, device, -1);

    return disp;
}

static void event_handler(lv_event_t * e)
{
    lv_event_code_t code = lv_event_get_code(e);

    if(code == LV_EVENT_CLICKED) {
        LV_LOG_USER("Clicked");
    }
    else if(code == LV_EVENT_VALUE_CHANGED) {
        LV_LOG_USER("Toggled");
    }
}

void lv_example_button_1(void)
{
    lv_obj_t * label;

    lv_obj_t * btn1 = lv_button_create(lv_screen_active());
    lv_obj_add_event_cb(btn1, event_handler, LV_EVENT_ALL, NULL);
    lv_obj_align(btn1, LV_ALIGN_CENTER, 0, -40);
    lv_obj_remove_flag(btn1, LV_OBJ_FLAG_PRESS_LOCK);

    label = lv_label_create(btn1);
    lv_label_set_text(label, "Button");
    lv_obj_center(label);

    lv_obj_t * btn2 = lv_button_create(lv_screen_active());
    lv_obj_add_event_cb(btn2, event_handler, LV_EVENT_ALL, NULL);
    lv_obj_align(btn2, LV_ALIGN_CENTER, 0, 40);
    lv_obj_add_flag(btn2, LV_OBJ_FLAG_CHECKABLE);
    lv_obj_set_height(btn2, LV_SIZE_CONTENT);

    label = lv_label_create(btn2);
    lv_label_set_text(label, "Toggle");
    lv_obj_center(label);

}

int main(int argc,char * args[]){

    lv_init();

    lv_display_t * disp = lv_linux_disp_init();
    lv_indev_t *indev = NULL;

    if(argc == 1){
        char *path = lv_libinput_find_dev(LV_LIBINPUT_CAPABILITY_TOUCH, true);
        indev = lv_libinput_create(LV_INDEV_TYPE_POINTER, path);
        printf("found the device : %s\n", path);
    }
    else{
        indev = lv_libinput_create(LV_INDEV_TYPE_POINTER, args[1]);
    }

    lv_indev_set_display(indev, disp);

    // lv_indev_t *touch = lv_evdev_create(LV_INDEV_TYPE_POINTER, "/dev/input/event2");
    // lv_indev_set_display(touch, disp);
    //lv_demo_benchmark();
    //lv_demo_widgets();

    lv_example_button_1();

    while(true){
        lv_timer_handler(); // Handle LVGL tasks
        
        usleep(5000);
    }

    return 0;
}