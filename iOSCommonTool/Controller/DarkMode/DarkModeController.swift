//
//  DarkModeController.swift
//  iOSCommonTool
//
//  Created by Joe on 2020/11/24.
//

import UIKit

class DarkModeController: BaseViewController {
    
    fileprivate var titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationController?.navigationBar.tintColor = UIColor.black
        //self.navigationController?.navigationBar.barTintColor = UIColor.black
        if #available(iOS 13.0, *) {
            //self.view.overrideUserInterfaceStyle = .unspecified
        } else {
            // Fallback on earlier versions
        }
        self.navigationItem.title = "暗黑模式"
        self.view.backgroundColor = UIColor.matchModeColor(lightModeColor: .white, darkModeColor: .black)
        setUpSubView()
        
        
        //let dic: [String:Any] = ["1.1":3.3]
        parametersEncryption(parmDic: ["1.1":3.3])
    }
    
    func setUpSubView() {
        titleLabel.text = "当前是否暗黑模式：\(isDarkMode ? "是暗黑模式":"不是暗黑模式")"
        titleLabel.textColor = UIColor.matchModeColor(lightModeColor: UIColor.hexColor(0x333333), darkModeColor: UIColor.white)
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.snp.center)
        }
        
        
        let colorLabel = UILabel()
        colorLabel.text = "测试不同模式下的颜色"
        if #available(iOS 11.0, *) {
            colorLabel.textColor = UIColor.init(named: "DefineColor")
        } else {
            // Fallback on earlier versions
            colorLabel.textColor = UIColor.green
        }
        self.view.addSubview(colorLabel)
        colorLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        let button = UIButton.init(type: .custom)
        button.setTitle("Button请点击", for: .normal)
        button.setTitleColor(UIColor.green, for: .normal)
        button.addTarget(self, action: #selector(topButtonClick), for: .touchUpInside)
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.view.snp.top).offset(20)
        }
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                titleLabel.text = "当前是否暗黑模式：\(isDarkMode ? "是暗黑模式":"不是暗黑模式")"
                print("模式变化了：\n oldTraitCollection:\(String(describing: previousTraitCollection)) \n newTraitCollection:\(self.traitCollection)")
            }
        }
        
    }
    
    
    @objc func topButtonClick() {
        print("点击了我！")
        //UITraitCollection.current.userInterfaceStyle
    }
    
    /*
    + (instancetype)sharedCMRequest
    {
        static CMRequest *shared = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            shared = [[CMRequest alloc] init];
        });
        return shared;
    }

    - (instancetype)init {
        self = [super init];
        if (self) {
            self.operationManager = [AFHTTPSessionManager manager];
            self.operationQueue = self.operationManager.operationQueue;
            self.operationManager.requestSerializer = [AFHTTPRequestSerializer serializer];
            self.operationManager.requestSerializer.timeoutInterval = TimeOutSeconds;
            self.operationManager.operationQueue.maxConcurrentOperationCount = 5;
            self.operationManager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
            //设置响应序列化器，解析Json对象
            AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
            //清除返回数据的 NSNull
            responseSerializer.removesKeysWithNullValues = YES;
            //设置接受数据的格式
            responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"application/x-javascript", @"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain",@"image/jpeg",@"image/png", nil];
            self.operationManager.responseSerializer = responseSerializer;
            //加上这行代码,https ssl验证
            [self.operationManager setSecurityPolicy:[self customSecurityPolicy]];
        }
        return self;
    }
*/
    
    
    public func parametersEncryption(parmDic: [String: Any]?) {
        let dic = [1:"12"]
        print("---\(dic)")
        
    }
    
    /*
    + (NSDictionary *)parametersEncryptionWithBaseDic:(NSDictionary *)baseDic withOptStr:(NSString*)optStr {
        //最后需要的字典
        __block NSMutableDictionary *finalDic = [[NSMutableDictionary alloc] init];
        if ([baseDic isKindOfClass:[NSDictionary class]]) {
            [baseDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                //将baseDic中的所有key,value加入finalDic中
                [finalDic setValue:obj forKey:key];
            }];
        }
        //添加OPT,_t,_s,version,appinfo,SLI
        //添加服务器版本号
        [finalDic setObject:SeverVersion forKey:@"version"];
        //添加app信息版本号（app别称/app版本号/手机类型/手机系统,例如@"longpei/3.2.1",@"zhongyong/3.2.1"）
        [finalDic setValue:AppInfoVersion forKey:@"appinfo"];
        //添加SLI令牌
        [finalDic setValue:[[GlobalData sharedGlobalData] checkIsLogin] ? JudgeString([GlobalData sharedGlobalData].userModel.sslToken) : @"" forKey:@"SLI"];
        //添加_t
        [finalDic setObject:[Itools beiJingTimeString] forKey:@"_t"];
        //添加OPT
        if([optStr isKindOfClass:[NSString class]]) {
            [finalDic setValue:optStr.length ? optStr:@"0" forKey:@"OPT"];
        }
        
        //把finalDic中的key排序,并以key=obj拼接起来,产生_s
        __block NSMutableArray *keyObjectArray = [[NSMutableArray alloc] init];
        [finalDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [keyObjectArray addObject:[NSString stringWithFormat:@"%@=%@",key,obj]];
        }];
        //按顺序排放key=obj
        NSArray *sortedArray = [keyObjectArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2 options:NSLiteralSearch];
        }];
        //key=obj末尾添加&拼接成字符串
        NSString *_s = [[[sortedArray componentsJoinedByString:@"&"] stringByAppendingString:@"GDgLwwdK270Qj1w4"] MD5Hash];
        //添加_s
        [finalDic setObject:_s forKey:@"_s"];
        
        return [finalDic copy];
    }
    
 */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
