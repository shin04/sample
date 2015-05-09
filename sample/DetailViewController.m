//
//  DetailViewController.m
//  sample
//
//  Created by 梶原大進 on 2015/04/25.
//  Copyright (c) 2015年 梶原大進. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) IBOutlet UITextField *titleField;

@property (strong, nonatomic) IBOutlet UITextView *contentField;

@property (strong, nonatomic) IBOutlet UIImage *photo;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        NSURL *FURL=(NSURL *)self.detailItem;
        NSDictionary *dic=[NSDictionary dictionaryWithContentsOfURL:FURL];
        
        
        self.titleField.text=dic[@"title"];
        self.contentField.text=dic[@"body"];
    }
}

//アプリが起動した時だけ呼び出される
- (void)viewDidLoad {
    [super viewDidLoad];
}

//この画面が呼び出される度に呼び出される
- (void)viewWillAppear:(BOOL)animated {
    [self configureView]; //保存されているデータを表示
}

//この画面から遷移する時に呼び出される
- (void)viewWillDisappear:(BOOL)animated {
    [self saveData]; //遷移する時にテキストデータを保存
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)saveData
{
    NSURL *FURL=(NSURL *)self.detailItem;
    NSDictionary *dic=@{@"title":self.titleField.text,@"body":self.contentField.text};
    [dic writeToURL:FURL atomically:YES];
}

//画像表示の処理
-(IBAction)image:(id)sender{
    //カメラロールにアクセス
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

//カメラロールから画像が選択された時に呼び出される
- (void)imagePickerController :(UIImagePickerController *)picker
        didFinishPickingImage :(UIImage *)image editingInfo :(NSDictionary *)editingInfo {
    NSLog(@"画像が選ばれました");
    
    NSLog(@"座標(%f, %f", self.contentField.contentOffset.x, self.contentField.contentOffset.y);
    
    /*
    //キャレットの座標を取得
    UITextPosition *position = [self.contentField selectedTextRange];
    NSLog(@"キャレットの座標%@", position);
     */

    /*
    //非表示領域の設定
    CGRect exclusionRect =
    CGRectMake(self.contentField.contentOffset.x, self.contentField.contentOffset.y, 100, 100);
    //NSLog(@"width = %d, height = %d", image.size.width, image.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:exclusionRect];
    //非表示領域をtextviewに追加
    self.contentField.textContainer.exclusionPaths = @[path];
     */
    
    CGRect rect = CGRectMake(0, 375, 100, 100);
    
    UIImageView *photo = [[UIImageView alloc]initWithFrame:rect];
    
    //選択した画像をphotoにセット
    photo.image = image;
    //photo.image = resizedImage;
    
    //photoをtextviewに追加
    [self.view addSubview:photo];
    
    NSLog(@"追加されました");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
