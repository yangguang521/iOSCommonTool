//
//  HomeConfigurationController.swift
//  iOSCommonTool
//
//  Created by Joe on 2021/1/5.
//

import UIKit

class HomeConfigurationController: BaseViewController {
    
    //@IBOutlet weak var tableView: UITableView!
    private var configurationTableView: UITableView!
    private var configurationModelArray = [HomeConfigurationModel]()
    //移动初始选中cell的截图
    private var snapshotView: UIView?
    //移动初始选中cell到的indexPath
    private var moveToIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "首页配置"
        self.view.backgroundColor = UIColor.white
        handleHomeConfigurationData()
        setUpSubviews()
    }
    
    private func handleHomeConfigurationData() {
        let primarySectionTypeArray: [HomeSectionType] = [.myReimbursement, .myLoanMoney, .myDocuments, .waitMyApproval, .reportForm]
        for sectionType in primarySectionTypeArray {
            let configurationModel = HomeConfigurationModel()
            configurationModel.configurationSectionType = sectionType
            configurationModel.isOpen = true
            configurationModelArray.append(configurationModel)
        }
        print("初始状态的modelArray-\(configurationModelArray)")
    }
    
    private func setUpSubviews() {
        configurationTableView = UITableView(frame: CGRect.zero, style: .grouped)
        //configurationTableView.isEditing = true
        configurationTableView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        configurationTableView.delegate = self
        configurationTableView.dataSource = self
        configurationTableView.separatorStyle = .none
        configurationTableView.register(HomeConfigurationCell.self, forCellReuseIdentifier: "\(HomeConfigurationCell.self)")
        view.addSubview(configurationTableView)
        configurationTableView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(view)
        }
        //添加长按手势
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressGestureRecognized(longPressGesture:)))
        //longPress.minimumPressDuration = 1
        configurationTableView.addGestureRecognizer(longPress)
    }
    
    //MARK：- 截图快照
    private func customSnapshotFromView(inputView: UIView?) -> UIView? {
        guard let snapshot = inputView?.snapshotView(afterScreenUpdates: true) else { return nil }
        snapshot.layer.masksToBounds = true
        snapshot.layer.cornerRadius = 5
        snapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
        snapshot.layer.shadowRadius = 5.0
        snapshot.layer.shadowOpacity = 0.4
        return snapshot
    }
    
    @objc func longPressGestureRecognized(longPressGesture: UILongPressGestureRecognizer) {
        /*
         case possible = 0
         
         case began = 1
         
         case changed = 2
         
         case ended = 3
         
         case cancelled = 4
         
         case failed = 5
         */
        
        //当前手势的状态
        let state = longPressGesture.state
        //点的位置一定在tableView上 sourcePoint不可能为空
        let sourcePoint = longPressGesture.location(in: configurationTableView)
        //可能是nil
        let sourceIndexPath = configurationTableView.indexPathForRow(at: sourcePoint)
        print("longPressGesture--row=\(sourceIndexPath?.row)--point=\(sourcePoint)--state=\(state.rawValue)")
        
        switch state {
        case .began:
            print("长按手势开始---begin")
            guard let beginIndexPath = sourceIndexPath, let selectCell = configurationTableView.cellForRow(at: beginIndexPath) as? HomeConfigurationCell else { return }
            moveToIndexPath = sourceIndexPath
            snapshotView = customSnapshotFromView(inputView: selectCell.centerView)
            guard let snapshot = snapshotView else { return }
            snapshot.center = selectCell.center
            //snapshot.alpha = 0.0
            configurationTableView.addSubview(snapshot)
            UIView.animate(withDuration: 0.25) {
                snapshot.transform = CGAffineTransform.init(scaleX: 1.05, y: 1.05)
                //snapshot.alpha = 0.9
            } completion: { (isFinished) in
                selectCell.isHideCenterView = true
            }
            break
        case .changed:
            print("长按手势移动---changed")
            //移动截图cell的centerView
            guard let snapshot = snapshotView else { return }
            //截图快照view跟随手指的位置移动
            snapshot.center.y = sourcePoint.y
            guard let sourcePath = sourceIndexPath, let movePath = moveToIndexPath else { return }
            if !(movePath.section == sourcePath.section && movePath.row == sourcePath.row) {
                //不在同一个IndexPath 记录到moveToIndexPath
                (configurationModelArray[movePath.row], configurationModelArray[sourcePath.row]) = (configurationModelArray[sourcePath.row], configurationModelArray[movePath.row])
                configurationTableView.moveRow(at: movePath, to: sourcePath)
                moveToIndexPath = sourceIndexPath
                print("长按手势移动---cell换行了")
            }
            break
        case .ended:
            print("长按手势结束---ended")
            guard let movePath = moveToIndexPath, let snapshot = snapshotView, let cell = configurationTableView.cellForRow(at: movePath) as? HomeConfigurationCell else { return }
            UIView.animate(withDuration: 0.25) {
                snapshot.center = cell.center
                snapshot.transform = CGAffineTransform.identity
                //snapshot.alpha = 0.0
            } completion: { (finished) in
                cell.isHideCenterView = false
                self.snapshotView?.removeFromSuperview()
                self.snapshotView = nil
                self.moveToIndexPath = nil
                self.configurationTableView.reloadData()
                print("移除了snapshotView--\(snapshot)--\(self.snapshotView)")
                print("查看当前移动cell后的modelArray-\(self.configurationModelArray)")
            }
            break
        default:
            break
        }
    }
    
    /*
     //移动之前的 [.myReimbursement, .myLoanMoney, .myDocuments, .waitMyApproval, .reportForm]
     [<iOSCommonTool.HomeConfigurationModel: 0x280b41850>,  我的报销
     <iOSCommonTool.HomeConfigurationModel: 0x280b41350>,   我的借款
     <iOSCommonTool.HomeConfigurationModel: 0x280b40040>,   我的单据
     <iOSCommonTool.HomeConfigurationModel: 0x280b41600>,   待我审批
     <iOSCommonTool.HomeConfigurationModel: 0x280b405d0>]   报表
     
     //移动之后的
     [<iOSCommonTool.HomeConfigurationModel: 0x280b405d0>,
     <iOSCommonTool.HomeConfigurationModel: 0x280b41850>,
     <iOSCommonTool.HomeConfigurationModel: 0x280b40040>,
     <iOSCommonTool.HomeConfigurationModel: 0x280b41600>,
     <iOSCommonTool.HomeConfigurationModel: 0x280b41350>]
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


extension HomeConfigurationController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configurationModelArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56+10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeConfigurationCell = tableView.dequeueReusableCell(withIdentifier: "\(HomeConfigurationCell.self)") as! HomeConfigurationCell
        cell.titleName = configurationModelArray[indexPath.row].titleName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        print("查看当前移动cell后的modelArray-\(configurationModelArray)")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("editingStyle--\(editingStyle)--\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("moveRowAtSourceIndexPath--\(sourceIndexPath.row)--\(destinationIndexPath.row)")
        //configurationModelArray.
        //[models exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    }
    
}
