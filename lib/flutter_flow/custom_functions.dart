import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<double> separaLatLng(LatLng posicao) {
  List<double> posicoes = [];
  posicoes.add(posicao.latitude);
  posicoes.add(posicao.longitude);

  return posicoes;
}

List<String> ordenarPaises(List<String> paises) {
  List<String> copiaLista = List.from(paises);
  copiaLista.sort();

  return copiaLista;
}

String limpaTelefone(String telefone) {
  String aux =
      telefone.replaceAll('(', '').replaceAll(')', '').replaceAll('-', '');

  return aux;
}

bool simpleSearchResults(
  String searchFor,
  String searchIn,
) {
  return searchIn.toLowerCase().contains(searchFor.toLowerCase());
}

DocumentReference? getReferenceUser(
  String nome,
  UserRecord usuarios,
) {
  if (usuarios.displayName.toUpperCase().contains(nome.toUpperCase())) {
    return usuarios.reference;
  }
}

bool showUserEmVoo(
  DocumentReference? searchFor,
  DocumentReference searchIn,
) {
  return searchFor == searchIn;
}

String paisesFiltro(List<String> lista) {
  String aux = '';

  if (lista.length > 3) {
    aux = 'Muitos países selecionados';
  } else {
    for (int i = 0; i < lista.length; i++) {
      aux += lista[i] + ', ';
    }

    aux = aux.substring(0, aux.length - 2);
  }

  return aux;
}

double somatorioKm(List<VooRecord> voos) {
  double aux = 0;

  for (int i = 0; i < voos.length; i++) {
    aux += voos[i].quilometragemTracejado;
  }

  return aux;
}

int duracaoVoo(
  DateTime saida,
  DateTime entrada,
) {
  final Duration duration = entrada.difference(saida);

  return duration.inMinutes;
}

String exibirDuracaoVoo(int duracao) {
  int auxHoras = 0;

  while (duracao >= 60) {
    auxHoras++;
    duracao -= 60;
  }

  String resultado;
  if (duracao == 0) {
    resultado = '${auxHoras}:${duracao}0';
  } else {
    resultado = '$auxHoras:$duracao';
  }

  return resultado;
}

int somatorioDuracao(List<VooRecord> voos) {
  int aux = 0;
  for (int i = 0; i < voos.length; i++) {
    aux += voos[i].duracao;
  }

  return aux;
}
