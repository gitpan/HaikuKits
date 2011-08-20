/*
 * Automatically generated file
 */

class Custom_BApplication : public BApplication {
	public:
		Custom_BApplication(const char* signature, status_t* error);
		Custom_BApplication(BMessage* archive);
		virtual ~Custom_BApplication();
		bool QuitRequested();
		void Pulse();
		void ReadyToRun();
		void MessageReceived(BMessage* message);
		void ArgvReceived(int32 argc, char** argv);
		void AppActivated(bool active);
		void RefsReceived(BMessage* message);
		void AboutRequested();
		object_link_data* perl_link_data;
}; // Custom_BApplication
