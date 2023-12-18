//
//  ViewController.swift
//  ScreenMirroring
//
//  Created by Knovator on 08/11/23.
//

import UIKit
import ConnectSDK

class ViewController: UIViewController, DevicePickerDelegate {
    
    
    func devicePicker(_ picker: DevicePicker!, didSelect device: ConnectableDevice!) {
        let groupId = "group.chat.rocket.knovator.ios"
        let sharedDefaults = UserDefaults(suiteName: groupId)
        sharedDefaults?.set(device.address, forKey: "kConnectableDeviceIpAddressKey")
        sharedDefaults?.synchronize()
        startscreen()
    }
    
    var isDiscoveringTV = false
    var discoveryManager: DiscoveryManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        startscreen()
    }
    
    func startscreen() {
        if #available(iOS 12.0, *) {
            let rpPickerView = RPSystemBroadcastPickerView(frame: view.bounds)
            rpPickerView.preferredExtension = "com.example.ScreenMirroring.Screen"
            rpPickerView.showsMicrophoneButton = false
            let button = rpPickerView.subviews.first as? UIButton
            button?.imageView?.tintColor = UIColor.black
            view.addSubview(rpPickerView)
        } else {
            // UNAVAILABLE
        }
    }
    @IBAction func startScan(_ sender: UIButton) {
        startDiscoveryTV()
    }
    
    func startDiscoveryTV() {
        isDiscoveringTV = true
        
        if discoveryManager == nil {
            discoveryManager = DiscoveryManager.shared()
        }
        
        // Sets a device search filter (Screen Mirroring Capability) for devices that support screen mirroring
        let capabilities = [
            kScreenMirroringControlScreenMirroring
        ]
        
        let filter = CapabilityFilter(capabilities: capabilities)
        discoveryManager!.capabilityFilters = [filter!]
        discoveryManager!.pairingLevel = DeviceServicePairingLevelOn
        discoveryManager!.registerDeviceService(WebOSTVService.self, withDiscovery: SSDPDiscoveryProvider.self)
        discoveryManager!.startDiscovery()
        discoveryManager!.devicePicker().delegate = self
//        discoveryManager!.devicePicker().show(nil)
    }
    
}

		
