package com.inbyte.cg.util;

import com.google.common.base.Throwables;
import com.intellij.notification.*;

public class MessageUtil {

    private static NotificationGroup pyrange_notification_group = new NotificationGroup("Inbyte-CG",
            NotificationDisplayType.BALLOON, true);

    public static void showSuccessMsg(String msg) {
        Notification notification = pyrange_notification_group.createNotification("Inbyte-CG message", msg, NotificationType.INFORMATION, null);
        Notifications.Bus.notify(notification);
    }

    public static void showErrorMsg(String msg) {
        Notification notification = pyrange_notification_group.createNotification("Inbyte-CG Error Message", msg, NotificationType.ERROR, null);
        Notifications.Bus.notify(notification);
    }
    public static void showErrorMsg(String msg, Exception e) {
        Notification notification = pyrange_notification_group.createNotification("Inbyte-CG Error Message",
                msg + "/n" + Throwables.getStackTraceAsString(e),
                NotificationType.ERROR, null);
        Notifications.Bus.notify(notification);
    }
}
