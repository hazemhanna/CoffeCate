//
//  File.swift
//  CoffeeCate
//
//  Created by MAC on 10/6/20.
//  Copyright © 2020 MAC. All rights reserved.
//

struct Setting: Codable {
    var id: Int?
    var name: String?
    var value: String?
    var SettingImage: Data?

}


import UIKit
import MessageUI
class HelpAndSupportingVC: UIViewController {

    @IBOutlet weak var SectionTableViewCell: UITableView!
    private let CellIdentifier = "SupportingCell"
    @IBOutlet weak var supportLabel: UILabel!
    var sectionArr = [Setting]() {
        didSet {
            DispatchQueue.main.async {
                self.SectionTableViewCell.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        SectionTableViewCell.delegate = self
        SectionTableViewCell.dataSource = self
        SectionTableViewCell.register(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
        supportLabel.adjustsFontSizeToFitWidth = true
        supportLabel.minimumScaleFactor = 0.5
        getData()
    }
    
    
       @IBAction func sideMenuAction(_ sender: UIBarButtonItem) {
           self.setupSideMenu()
       }
       @IBAction func backAction(_ sender: UIBarButtonItem) {
            self.navigationController?.popViewController(animated: true)
       }
     
       @IBAction func cartAction(_ sender: UIBarButtonItem) {
           let main = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "CartVC")
           self.navigationController?.pushViewController(main, animated: true)
       }
    

    func SelectionAction(index: Int) {
        switch sectionArr[index].name {
        case "twitter":
            let userName = sectionArr[index].value ?? ""

            let appURL = URL(string: "twitter:///\(userName)")!
            let webURL = URL(string: "https://twitter.com/\(userName)")!
            if UIApplication.shared.canOpenURL(appURL as URL) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(appURL)
                } else {
                    UIApplication.shared.openURL(appURL)
                }
            } else {

                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(webURL)
                } else {
                    UIApplication.shared.openURL(webURL)
                }
            }
        case "whatsApp":
            let whatsapp = sectionArr[index].value ?? ""
            let urlWhats = "https://wa.me/\(whatsapp)"
            if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
                if let whatsappURL = URL(string: urlString) {
                    if UIApplication.shared.canOpenURL(whatsappURL){
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(whatsappURL)
                        }
                    }
                    else {
                        displayMessage(title: "", message: "Install WhatsApp First", status: .info, forController: self)
                    }
                }
            }
        case "support":
            if let url = URL(string: "tel://\(sectionArr[index].value ?? "")"),
                UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler:nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        case "email":
            sendEmail(email: sectionArr[index].value ?? "")
        default:
            print("Default")
            break

        }
    }

    func sendEmail(email: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            mail.setMessageBody("", isHTML: true)
            present(mail, animated: true)
        } else {
            // show failure alert
            displayMessage(title: "", message: "Please Add your an Email to your device first", status: .error, forController: self)
            print("Please check the email.")
        }
    }


}
extension HelpAndSupportingVC {
    func getData()  {
        
        self.sectionArr.append(Setting(id: 0, name: "twitter", value: "", SettingImage: #imageLiteral(resourceName: "Vector Smart Object").pngData()))
        self.sectionArr.append(Setting(id: 1, name: "whatsApp", value: "", SettingImage: #imageLiteral(resourceName: "Vector Smart Object-2").pngData()))
        self.sectionArr.append(Setting(id: 2, name: "support", value: "", SettingImage:#imageLiteral(resourceName: "Vector Smart Object-3").pngData()))
        self.sectionArr.append(Setting(id: 3, name: "email", value: "", SettingImage: #imageLiteral(resourceName: "Vector Smart Object-1").pngData()))
       
    }
}
extension HelpAndSupportingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as? SupportingCell else {return UITableViewCell()}
        cell.config(imagePath: UIImage(data: sectionArr[indexPath.row].SettingImage!) ?? #imageLiteral(resourceName: "picture-1"), name: sectionArr[indexPath.row].name ?? "")
        cell.selectionAction = {
            self.SelectionAction(index: indexPath.row)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArr.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectionAction(index: indexPath.row)
    }


}
extension HelpAndSupportingVC: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let error = error{
            print("error \(error.localizedDescription)")
            controller.dismiss(animated: true)
        }
        switch result {
        case .cancelled:
            print("cancelled")
        case .sent:
            print("sent")
            if "lang".localized == "ar" {
                displayMessage(title: "", message: "تم الإرسال", status: .success, forController: self)
            } else {
                displayMessage(title: "", message: "Message Sent", status: .success, forController: self)
            }

        case .failed:
            print("faild")
            if "lang".localized == "ar" {
                displayMessage(title: "", message: "فشل الإرسال", status: .error, forController: self)
            } else {
                displayMessage(title: "", message: "Message Failed To Send", status: .error, forController: self)
            }

        case .saved:
            print("saved")
            if "lang".localized == "ar" {
                displayMessage(title: "", message: "تم حفظ الرسالة", status: .success, forController: self)
            } else {
                displayMessage(title: "", message: "Message Saved", status: .success, forController: self)
            }

        @unknown default:
            fatalError()
        }
        controller.dismiss(animated: true)

    }
}


