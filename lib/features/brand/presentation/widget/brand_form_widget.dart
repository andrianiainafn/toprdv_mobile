import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/core/global/action_button.dart';
import 'package:my_template_project/features/brand/domain/entity/related_brand.dart';
import '../../domain/entity/brand.dart';
import '../bloc/brand_bloc.dart';
import '../bloc/related_users_bloc.dart';



// État du widget
class BrandFormWidget extends StatefulWidget {
  const BrandFormWidget({super.key});

  @override
  State<BrandFormWidget> createState() => _BrandFormWidgetState();
}

class _BrandFormWidgetState extends State<BrandFormWidget> {
  List<RelatedBrand> brandSelected = [];

  @override
  void initState() {
    super.initState();
    // Équivalent du useEffect pour charger les données initiales
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BrandBloc>().add(GetBrandEvent());
      context.read<RelatedUsersBloc>().add(GetRelatedUser());
    });
  }
  void onSubmitForm(){
    print("brand selected : $brandSelected");
    BlocProvider.of<RelatedUsersBloc>(context).add(UpdateRelatedUserEvent(brandSelected));
  }

  bool checkBrandAlreadySelected(Brand brand) {
    return brandSelected.any((item) => item.id == brand.id);
  }

  void updateBrandSelected(Brand brand) {
    setState(() {
      final brandAsRelatedUser = RelatedBrand(
        id: brand.id,
        brandName: brand.value,
      );

      if (checkBrandAlreadySelected(brand)) {
        brandSelected.removeWhere((b) => b.id == brand.id);
      } else {
        brandSelected.add(brandAsRelatedUser);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, brandState) {
        if (brandState is LoadingBrand) {
          return const CircularProgressIndicator();
        }

        if (brandState is LoadedBrand) {
          return BlocListener<RelatedUsersBloc, RelatedUsersState>(
            listener: (context, relatedUsersState) {
              if (relatedUsersState is RelatedUsersLoaded) {
                setState(() {
                  brandSelected = relatedUsersState.relatedUsers;
                });
              }
            },
            child: Column(
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: brandState.brand.map((item) =>
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.48,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.value,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Checkbox(
                              value: checkBrandAlreadySelected(item),
                              onChanged: (_) => updateBrandSelected(item),
                              activeColor: Colors.green.shade600,
                            ),
                          ],
                        ),
                      ),
                  ).toList(),
                ),
                ActionButton(onSubmitForm: onSubmitForm, title: "Sauvegarder")
              ],
            ),
          );
        }

        if (brandState is ErrorBrand) {
          return Text('Erreur: ${(brandState as ErrorBrand).message}');
        }
        return const SizedBox.shrink();
      },
    );
  }
}