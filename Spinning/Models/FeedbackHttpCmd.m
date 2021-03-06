//
//  FeedbackHttpCmd.m
//  Spinning
//
//  Created by Robin on 9/3/13.
//  Copyright (c) 2013 Robin. All rights reserved.
//

#import "FeedbackHttpCmd.h"
@implementation FeedbackModel

@end

@implementation FeedbackHttpCmd
@synthesize suggestion = _suggestion;

-(id)init{
    self = [super init];
    if (self) {
        self.suggestion = nil;
    }
    return self;
}

- (NSString*)onSuffixUrl
{
    return kSpinningSuggestion;
}

- (NSMutableDictionary *)paramDict
{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.suggestion forKey:kSpinningHttpRequestKeySuggestion];
    if (self.userId) {
        [dic setObject:self.userId forKey:kSpinningHttpRequestKeyUserid];
    }
    
    return dic;
}

- (void)dealloc
{
    RbSafeRelease(_suggestion);
    RbSuperDealoc;
}

@end
