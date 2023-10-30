import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final Color color;

  // para melhorar performance e deixar o construtor da classe constante, é necessário que seus atributos passados sejam final ou const
  const CategoryModel({
    required this.id,
    required this.title,
    // deixando um valor default caso não seja passada a cor
    this.color = Colors.orange,
  });
}
