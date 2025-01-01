import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onSubmitForm;
  final String title;
  final bool? isLoading;
  const ActionButton({super.key, required this.onSubmitForm, required this.title, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity, // Largeur 100% du parent
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, // Couleur de fond personnalisée
          foregroundColor: Colors.white, // Couleur du texte
          padding: const EdgeInsets.symmetric(vertical: 16.0), // Espacement vertical
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Coins arrondis
          ),
        ),
        onPressed: onSubmitForm,
        child: checkLoading(isLoading,  title)
      ),
    );
  }
}

Widget checkLoading(bool? isLoading,String title){
  if(isLoading != null){
     return isLoading ? CircularProgressIndicator(color: Colors.white)
         : Text(
         title,
         style: TextStyle(
         fontSize: 18.0, // Taille de la police
         fontWeight: FontWeight.bold, // Police en gras
     )
     );
  }
  else{
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.0, // Taille de la police
        fontWeight: FontWeight.bold, // Police en gras
      ),
    );
  }
}