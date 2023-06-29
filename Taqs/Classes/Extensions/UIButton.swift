//
//  UIButton.swift
//  Taqs
//
//  Created by Salma on 17/06/2023.
//
import UIKit

extension UITableView
{
    func registerNib<Cell: UITableViewCell>(cell: Cell.Type) {
            let nibName = String(describing: Cell.self)
            register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
        }
}

