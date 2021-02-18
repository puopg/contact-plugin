//
//  Plugin.m
//  Plugin
//
//  Created by Michael Chen on 2/18/21.
//  Copyright © 2021 Max Lynch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(ContactsPlugin, "ContactsPlugin",
           CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getContacts, CAPPluginReturnPromise);
)
