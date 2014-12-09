#define RGB(r, g, b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#import "ViewController.h"

@interface ViewController ()
- (IBAction)takePhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *takePhoto;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewSelect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.takePhoto.layer.cornerRadius = 6;
    self.takePhoto.clipsToBounds = YES;
    self.takePhoto.backgroundColor = RGB(39, 41, 42);
    self.takePhoto.layer.borderColor = self.takePhoto.tintColor.CGColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)takePhoto:(id)sender
{

  
}





#pragma marks - Implementing the Delegate Methods of UIImagePickerController

// user chooses an image or takes a photo
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageViewSelect.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

// User click's the "cancel" button
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


@end
