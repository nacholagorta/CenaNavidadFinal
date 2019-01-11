

import UIKit


protocol mdfUserDelegate: class {
    func mdfUserDelegate(_vc: mdfAlertViewController, didEditTask task: Participantes)
    
}

class mdfAlertViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    weak var delegate: mdfUserDelegate!
    internal var repository: LocalPeopleRepository!
    internal var task: Participantes!
   internal var participantes: [Participantes] = []
    
    
    
    convenience init(participante: Participantes){
        self.init()
            //self.task.id = UUID().uuidString
            self.task = participante
            self.task.id = participante.id
        self.task.isDone = participante.isDone
        print("")
        print("")
        print(participante.id)
        print(participante.name)
        print(participante.isDone)
        print("")
        print("")
    }
    
    @IBAction func btnCancelPressed(){
        let comVC = ParticipantesViewController()
        navigationController?.pushViewController(comVC, animated: true)
        
    }
    
    @IBAction func btnSavePressed(){
        if(repository.get(name: textField.text!) != nil) || (textField.text?.elementsEqual(""))!{
            print("Introduce un nombre válido")
        }
        else{
            let newName = textField.text
            self.task.name = newName
            repository.update(a: task)
          
            let comVC = ParticipantesViewController()
            navigationController?.pushViewController(comVC, animated: true)
            
       
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
repository = LocalPeopleRepository()
        textField.text = task.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
