package com.timedancing.easyfirewall.core.util;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import com.timedancing.easyfirewall.core.service.FirewallVpnService;
import com.timedancing.easyfirewall.core.tcpip.IPHeader;
import com.timedancing.easyfirewall.core.tcpip.UDPHeader;

import java.net.DatagramSocket;
import java.net.Socket;

/**
 * Created by zengzheying on 16/1/12.
 */
public class VpnServiceHelper {

	public static final int START_VPN_SERVICE_REQUEST_CODE = 2015;
	private static FirewallVpnService sVpnService;
	private static Context mainContext;

	public static void setMainContext(Context mContext){
		mainContext = mContext;
	}

	public static void onVpnServiceCreated(FirewallVpnService vpnService) {
		sVpnService = vpnService;
	}

	public static void onVpnServiceDestroy() {
		sVpnService = null;
	}

	public static void sendUDPPacket(IPHeader ipHeader, UDPHeader udpHeader) {
		if (sVpnService != null) {
			sVpnService.sendUDPPacket(ipHeader, udpHeader);
		}
	}

	public static boolean protect(Socket socket) {
		if (sVpnService != null) {
			return sVpnService.protect(socket);
		}
		return false;
	}

	public static boolean protect(DatagramSocket socket) {
		if (sVpnService != null) {
			return sVpnService.protect(socket);
		}
		return false;
	}

	public static boolean vpnRunningStatus() {
		if (sVpnService != null) {
			return sVpnService.vpnRunningStatus();
		}
		return false;
	}

	public static void changeVpnRunningStatus(Context context, boolean isStart) {
		if (context == null) {
			System.out.println("context == null");
			return;
		}
		FirewallVpnService.setMainContext(context);
		if (isStart) {
			Intent intent = FirewallVpnService.prepare(context);
			if(intent != null){
				((Activity) context).startActivityForResult(intent, START_VPN_SERVICE_REQUEST_CODE);
			}
			startVpnService(context);

			// if (intent == null) {
			// 	System.out.println("VPN START VpnServiceHelper");
			// 	startVpnService(context);
			// } else {
			// 	if (context instanceof Activity) {
			// 		System.out.println("VPN START VpnServiceHelper 2");
			// 		((Activity) context).startActivityForResult(intent, START_VPN_SERVICE_REQUEST_CODE);
			// 	}
			// }
		} else {
			boolean stopStatus = false;
			sVpnService.setVpnRunningStatus(stopStatus);
		}
	}

	public static void startVpnService(Context context) {
		if (context == null) {
			return;
		}

		context.startService(new Intent(context, FirewallVpnService.class));
	}

	public static void reloadVPN(Context context) throws Exception {
        sVpnService.reloadVPN();
    }

	public static void reloadVPNWithNewHosts(Context context) throws Exception {
        sVpnService.reloadVPNWithNewHosts();
    }
}
