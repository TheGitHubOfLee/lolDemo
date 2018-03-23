//
//  BroadSideViewController.m
//  SlideText9
//
//  Created by lanouhn on 16/1/8.
//  Copyright © 2016年 LiYaJun. All rights reserved.
//

#import "BroadSideViewController.h"
#import "MineBroadViewTemplate.h"
#define kPhotoImage @"photoImage"
#define kName @"name"
#define kSays @"says"
#import "MineCollectionController.h"
#import "DataBase.h"
#import "DisclaimerViewController.h"

@interface BroadSideViewController ()<UIImagePickerControllerDelegate , UINavigationControllerDelegate , MineBroadViewTemplateDedelegate>

@property (nonatomic , retain) MineBroadViewTemplate *mineBroadVT;

@end

@implementation BroadSideViewController

#pragma mark - 重写dealloc
-(void)dealloc {
    
    self.mineBroadVT = nil;
    
    [super dealloc];
}

#pragma mark - 懒加载
- (MineBroadViewTemplate *)mineBroadVT {
    
    if (_mineBroadVT == nil) {
        self.mineBroadVT = [[MineBroadViewTemplate new] autorelease];
    }
    return [[_mineBroadVT retain] autorelease];
}

-(void)loadView {

    self.mineBroadVT.delegate = self;
    
    self.view = _mineBroadVT;
    // 让视图的指针属性指向视图控制器
    _mineBroadVT.broadSVC = self;
    [_mineBroadVT release];
    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"broadBackImage.png"]];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

}

- (void)tapGurester {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"个人信息修改功能和登陆功能请期待2.0版本哦...(*^__^*) 嘻嘻……!" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"谢谢支持" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - 头像添加图片<MineBroadViewTemplateDelegate>
- (void)addPhotoImageBy:(UIGestureRecognizer *)tap {
    [self tapGurester];
//    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
//    
//    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    
//    imagePickerController.delegate = self;
//    
//    imagePickerController.allowsEditing = YES;
//    
//    [self presentViewController:imagePickerController animated:YES completion:^{
//        
//    }];
//    
//    [imagePickerController release];
}

//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
//    
//    // 创建文件管理对象
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    // 创建沙盒路径
//    NSString *stringPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    
//    // 创建文件路径
//    NSString *photoImagePath = [stringPath stringByAppendingPathComponent:@"PhotoImage"];
//    
//    if (![[NSFileManager defaultManager] fileExistsAtPath:photoImagePath]) {
//        
//        [fileManager createDirectoryAtPath:photoImagePath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    
//    UIImageView *pImage = [[[UIImageView alloc] initWithImage:[info objectForKey:UIImagePickerControllerEditedImage]]autorelease];
//    
//    [UIImageJPEGRepresentation(pImage.image, 1.0) writeToFile:[photoImagePath stringByAppendingPathComponent:[NSString stringWithFormat:@"photoImage%@" , @".jpg"]] atomically:YES];
//    
//    NSString *readPath = [photoImagePath stringByAppendingString:@"/photoImage.jpg"];
//    
//    NSData *data = [NSData dataWithContentsOfFile:readPath];
//    
//    self.mineBroadVT.headImageView.image = [UIImage imageWithData:data];
//    
//    self.mineBroadVT.headImageView.image = [UIImage imageWithContentsOfFile:readPath];
//    
////    NSLog(@"%@" , self.mineBroadVT.headImageView);
//    
//    [picker dismissViewControllerAnimated:YES completion:^{
//        
//    }];
//}

- (void)writeNameTittleBy:(UITapGestureRecognizer *)tap {
    [self tapGurester];
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入昵称" message:nil preferredStyle:UIAlertControllerStyleAlert];
//    
//    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//       
//        textField.borderStyle = UITextBorderStyleBezel;
//        
//        textField.keyboardType = UIKeyboardAppearanceAlert;
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
//    }];
//    
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
//        
//        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
//        
//    }];
//    
//    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确认" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    
//    [alertController addAction:cancel];
//    
//    [alertController addAction:confirm];
//    
//    [self presentViewController:alertController animated:YES completion:^{
//        
//    }];
//    
//    [alertController release];
}

//- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
//    
//    // 创建文件管理器
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    // 创建沙盒路径
//    NSString *sandBoxPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    
//    // 创建文件夹管理路径
//    NSString *NickNameStringPath = [sandBoxPath stringByAppendingPathComponent:@"NickName"];
//    
//    // 判断文件夹是否存在,如果不存在,就创建
//    if (![[NSFileManager defaultManager] fileExistsAtPath:NickNameStringPath]) {
//        
//        [fileManager createDirectoryAtPath:NickNameStringPath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    
//    // 创建文件路径
//    NSString *str = [NickNameStringPath stringByAppendingString:@"/nickName.txt"];
//    
//    UITextField *text = notification.object;
//    
//    [text.text writeToFile:str atomically:YES encoding:NSUTF8StringEncoding error:nil];
//    
//    self.mineBroadVT.nameLabel.text = [NSString stringWithContentsOfFile:str encoding:YES error:nil];
//}

- (void)writeSignatureBy:(UITapGestureRecognizer *)tap {
    
    [self tapGurester];
//    // 创建图案出视图控制器
//    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"请输入警示语!" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
//    
//    [alertC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        
//        textField.borderStyle = UITextBorderStyleBezel;
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleSignatureLabelNotification:) name:UITextFieldTextDidChangeNotification object:textField];
//    }];
//    
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
//        
//        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertC.textFields.firstObject];
//    }];
//    
//    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确认" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    
//    [alertC addAction:cancel];
//    
//    [alertC addAction:confirm];
//    
//    [self presentViewController:alertC animated:YES completion:^{
//        
//    }];
}


//- (void)handleSignatureLabelNotification:(NSNotification *)notification {
//    
//    // 创建文件管理器
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    // 创建沙盒路径
//    NSString *sandBoxPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    
//    // 创建文件存储路径
//    NSString *signatureLabelPath = [sandBoxPath stringByAppendingPathComponent:@"signature"];
//    
//    // 判断文件夹是否存在
//    if (![[NSFileManager defaultManager] fileExistsAtPath:signatureLabelPath]) {
//        
//        [fileManager createDirectoryAtPath:signatureLabelPath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    
//    // 创建文件写入路径
//    NSString *fileWriteToPath = [signatureLabelPath stringByAppendingPathComponent:@"signature.txt"];
//    
//    UITextField *text = notification.object;
//    
//    [text.text writeToFile:fileWriteToPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
//    
//    self.mineBroadVT.signatureLabel.text = [NSString stringWithContentsOfFile:fileWriteToPath encoding:NSUTF8StringEncoding error:nil];
//}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 点击我的收藏
- (void)clickMineCollectionByNSInteger:(NSInteger)integer {
    
    if (0 == integer) {
        
        MineCollectionController *mineCC = [[MineCollectionController alloc] init];
        
        UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:mineCC]autorelease];
        
        mineCC.navigationItem.title = @"我的收藏";
        
        [self presentViewController:nav animated:YES completion:^{
            
        }];
        
        [mineCC release];
        
    }else if (1 == integer){
        
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"警告!" message:@"确定要清除缓存么?" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            

        }];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确认" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
            // 清除缓存
            [[DataBase shareDataBase] deleteAll];
            
            [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        }];
        
        [alertC addAction:cancel];
        
        [alertC addAction:confirm];
        
        [self presentViewController:alertC animated:YES completion:^{
            
        }];
    }else if (2 == integer) {
        
        DisclaimerViewController *dis = [[[DisclaimerViewController alloc] init] autorelease];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:dis];
        
        [self presentViewController:nav animated:YES completion:nil];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
