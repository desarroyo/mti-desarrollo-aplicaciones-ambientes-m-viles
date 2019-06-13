//
//  ViewController.swift
//  sesion-3-4
//
//  Created by CTA CUCEA on 6/12/19.
//  Copyright © 2019 CTA CUCEA. All rights reserved.
//

import UIKit

//los tableView trabajan con Delegados y fuentes de información
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void

    enum AnimationFactory {
        
        static func makeFadeAnimation(duration: TimeInterval, delayFactor: Double) -> Animation {
            return { cell, indexPath, _ in
                cell.alpha = 0
                
                UIView.animate(
                    withDuration: duration,
                    delay: delayFactor * Double(indexPath.row),
                    animations: {
                        cell.alpha = 1
                })
            }
        }
    }
    
    final class Animator {
        private var hasAnimatedAllCells = false
        private let animation: Animation
        
        init(animation: @escaping Animation) {
            self.animation = animation
        }
        
        func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
            guard !hasAnimatedAllCells else {
                return
            }
            
            animation(cell, indexPath, tableView)
            
            //hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //los table view, necesitan saber cuantas filas mostrar en cada sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadTable()
    }
    
    func reloadTable(){
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Los tableView necesitan saber cual celda debe mostrar en cual posición
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "task")
        
        cell?.textLabel?.text = tasks[indexPath.row].task
        cell?.detailTextLabel?.text = tasks[indexPath.row].dueDate.description
        
        let animation = AnimationFactory.makeFadeAnimation(duration: 0.5, delayFactor: 0.1)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell!, at: indexPath, in: tableView)
        
        return cell!
    }
    
    @IBAction func onAgregarRegistro(_ sender: Any) {
        let fecha:Date = Date()
        tasks.append(TaskModel(task: "Tarea " + String(tasks.count), dueDate: fecha))
        reloadTable()
    }
    
}

