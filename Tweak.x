#import <notify.h>
@interface UniWebView:UIWebView
@end

BOOL enabled;
%hook UniWebView
- (void)loadRequest:(NSURLRequest *)request{
	if(!enabled) return %orig;
	NSString* urlString=[[request URL ] absoluteString];
	NSLog(@"%@",urlString);
	NSString* html=[[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil];
	NSRange range=[html rangeOfString:@"<style type=\"text/css\">"];
	NSUInteger location=range.location+range.length;
	NSString*head=[html substringToIndex:location];
	NSString*tail=[html substringFromIndex:location];
	html=[NSString stringWithFormat:@"%@.gonggao{-webkit-overflow-scrolling: touch;}%@",head,tail];



	[self loadHTMLString:html baseURL:[request URL]];
	// %orig;
}
%end

BOOL loadPref(){
	NSLog(@"loadPref..........");
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.brend0n.fgooverflowscrolling.plist"];
	if(!prefs) enabled=YES;
	else enabled=[prefs[@"enabled"] boolValue];
	return enabled;
}
%ctor{
	if(!loadPref()) return;
	NSLog(@"ctor: fgoOverflowScrolling");
	int token = 0;
	notify_register_dispatch("com.brend0n.fgooverflowscrolling/loadPref", &token, dispatch_get_main_queue(), ^(int token) {
		loadPref();
	});
}
