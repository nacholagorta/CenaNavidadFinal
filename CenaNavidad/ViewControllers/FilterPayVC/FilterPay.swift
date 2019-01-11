
import UIKit

class FilterPay: UIViewController {
    @IBOutlet weak var tablaFiltered: UITableView!
    internal var participantes: [Participantes] = []
 internal var participantesMorososArray: [Participantes] = []

    convenience init(task: [Participantes])
    {
        self.init()
        self.participantes = task
    }
    
    internal func registerCells()
    {
        let indentifier = "FilteredPayCell"
        let nib = UINib(nibName: indentifier, bundle: nil)
        tablaFiltered?.register(nib, forCellReuseIdentifier: "FilteredPayCell")
        
        let indentifier2 = "EmptyTableViewCell"
        let nib2 = UINib(nibName: indentifier2, bundle: nil)
        tablaFiltered?.register(nib2, forCellReuseIdentifier: "EmptyTableViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      registerCells()
        let participantesMorosos = participantes.filter{
            (participantes) -> Bool in return participantes.isDone == true
        }
        participantesMorososArray = participantesMorosos
        // Do any additional setup after loading the view.
        print(participantesMorososArray)
        print(participantesMorosos)
        print(participantes)
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
extension FilterPay: UITableViewDelegate,UITableViewDataSource
    
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if participantesMorososArray.count == 0 {
            return 1
        }
        else {
            return participantesMorososArray.count
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if participantesMorososArray.count == 0 {
            return 137
        }
        else{
            return 55.0
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if participantesMorososArray.count == 0{
            let cell: EmptyTableViewCell = (tablaFiltered.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath) as? EmptyTableViewCell)!
           // cell.delegate = self as! EmptyTableViewCellDelegate
            return cell
            
        }
        else {
            let cell: FilteredPayCell = (tablaFiltered.dequeueReusableCell(withIdentifier: "FilteredPayCell", for: indexPath) as? FilteredPayCell)!
            let participants = participantesMorososArray[indexPath.row]
            cell.lblFilteredName.text = participants.name
            
            return cell
        }
        
    }
}
