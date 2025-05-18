//
//  UserModel.swift
//  HW 6 task LIST
//
//  Created by Игорь Крысин on 04.08.2024.
//
//
//     сделайте на первой странице List со списком дел, простое перечисление, так же у каждой записи будет иконка, обычный чек, если дело выполнено, если нет, то другую иконку, на усмотрение, по визуалу и сожержимому ячейки, пусть будет изображение, название и как раз иконка. При нажатии идет переход внутрь записи, где через форму уже  будет список пунктов текущего дела, возможность отметить, выполнено или нет и так же возможность добавить новый пункт для выполнения. Визуал любой, но он в принципе стандартный получается. Хранить ни где не нужно, это только UI


import Foundation

struct TaskModel: Hashable, Identifiable {
    
    let id = UUID()
    var name: String?
    var icon: String
    var image: String?
    var doneIcone: String
    var isDone: Bool
    
    static func mokeData() -> [TaskModel] {
        [
            TaskModel(name: "first", icon: "circle", image: "img1", doneIcone: "checkmark", isDone: true),
            TaskModel(name: "second", icon: "circle", image: "img2", doneIcone: "checkmark", isDone: false),
            TaskModel(name: "third", icon: "circle", image: "img3", doneIcone: "checkmark", isDone: true),
            TaskModel(name: "fourth", icon: "circle", image: "img4", doneIcone: "checkmark", isDone: false),
            TaskModel(name: "fifth", icon: "circle", image: "img", doneIcone: "checkmark", isDone: false),
        ]
    }
    
    
}




