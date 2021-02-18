import { WebPlugin } from '@capacitor/core';
import { ContactsPluginPlugin } from './definitions';
export declare class ContactsPluginWeb extends WebPlugin implements ContactsPluginPlugin {
    constructor();
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
    getContacts(filter: string): Promise<{
        results: any[];
    }>;
}
declare const ContactsPlugin: ContactsPluginWeb;
export { ContactsPlugin };
