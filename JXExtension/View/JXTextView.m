//
//  JXTextView.m
//  JXExtension
//
//  Created by Jeason on 2017/6/15.
//  Copyright © 2017年 JeasonLee. All rights reserved.
//

#import "JXTextView.h"

@interface JXTextView()

@property (nonatomic, strong) UILabel *placeHolderLabel;

@end

@implementation JXTextView

@synthesize placeholder = _placeholder;
@synthesize placeholderColor = _placeholderColor;

#pragma mark - LifeCycle

- (void)awakeFromNib {
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.text.length == 0 && self.placeholder.length > 0) {
        [self.placeHolderLabel setAlpha:1];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Event Response

- (void)textChanged:(NSNotification *)notification {
    if (self.placeholder.length == 0) {
        return;
    }
    if (self.text.length == 0) {
        [self.placeHolderLabel setAlpha:1];
    } else {
        [self.placeHolderLabel setAlpha:0];
    }
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

#pragma mark - Property method

- (void)setMasksToBounds:(BOOL)masksToBounds {
    self.layer.masksToBounds = masksToBounds;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (NSString *)placeholder {
    return _placeholder;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder.copy;
    self.placeHolderLabel.text = placeholder;
    [self.placeHolderLabel sizeToFit];
}

- (UIColor *)placeholderColor {
    if (_placeholderColor == nil) {
        _placeholderColor = [UIColor lightGrayColor];
    }
    return _placeholderColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    self.placeHolderLabel.textColor = placeholderColor;
    [self.placeHolderLabel sizeToFit];
}

- (UILabel *)placeHolderLabel {
    UIEdgeInsets insets = self.textContainerInset;
    if (_placeHolderLabel == nil && self.placeholder.length > 0) {
        _placeHolderLabel = [[UILabel alloc] init];
        _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _placeHolderLabel.font = self.font;
        _placeHolderLabel.backgroundColor = [UIColor clearColor];
        _placeHolderLabel.textColor = self.placeholderColor;
        _placeHolderLabel.alpha = 0;
        _placeHolderLabel.numberOfLines = 0;
        [_placeHolderLabel setFrame:CGRectMake(insets.left + 5, insets.top, CGRectGetWidth(self.bounds) - (insets.left + insets.right + 10), CGRectGetHeight(_placeHolderLabel.frame))];
        [self addSubview:_placeHolderLabel];
        [self sendSubviewToBack:_placeHolderLabel];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_placeHolderLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:insets.left + 5]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_placeHolderLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:insets.top]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_placeHolderLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:insets.right + 5]];
    }
    return _placeHolderLabel;
}

@end
