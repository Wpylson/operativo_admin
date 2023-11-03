import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:operativo_admin/views/banners/upload_banners_screen.dart';
import 'package:operativo_admin/views/categories/categories_screen.dart';
import 'package:operativo_admin/views/dashboard/dashboard_screen.dart';
import 'package:operativo_admin/views/orders/orders_screen.dart';
import 'package:operativo_admin/views/products/products.screen.dart';
import 'package:operativo_admin/views/vendors/vendors_screen.dart';
import 'package:operativo_admin/views/withdraw/withdraw_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedItem = DashboardScreen();

  screenSelector(item) {
    switch (item.route) {
      case DashboardScreen.routeName:
        setState(() {
          _selectedItem = const DashboardScreen();
        });
        break;
      case VendorsScreen.routeName:
        setState(() {
          _selectedItem = const VendorsScreen();
        });
        break;
      case WithDrawScreen.routeName:
        setState(() {
          _selectedItem = const WithDrawScreen();
        });
        break;
      case OrdersScreen.routeName:
        setState(() {
          _selectedItem = const OrdersScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedItem = CategoriesScreen();
        });
        break;
      case ProductsScreen.routeName:
        setState(() {
          _selectedItem = const ProductsScreen();
        });
        break;
      case UploadBannerScreen.routeName:
        setState(() {
          _selectedItem = const UploadBannerScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: const Text("Operativo Management"),
        centerTitle: true,
        elevation: 1.0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Perfil'),
          )
        ],
      ),
      sideBar: SideBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        activeBackgroundColor: const Color(0x00ffffff),
        borderColor: Theme.of(context).colorScheme.secondary,
        iconColor: Theme.of(context).colorScheme.primary,
        textStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 14,
        ),
        activeTextStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: DashboardScreen.routeName,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Vendedores',
            route: VendorsScreen.routeName,
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: 'Withdrawl',
            route: WithDrawScreen.routeName,
            icon: CupertinoIcons.money_dollar_circle,
          ),
          AdminMenuItem(
            title: 'Pedidos',
            route: OrdersScreen.routeName,
            icon: CupertinoIcons.shopping_cart,
          ),
          AdminMenuItem(
            title: 'Categorias',
            route: CategoriesScreen.routeName,
            icon: Icons.category,
          ),
          AdminMenuItem(
            title: 'Produtos',
            route: ProductsScreen.routeName,
            icon: Icons.grid_view_rounded,
          ),
          AdminMenuItem(
            title: 'Banners',
            route: UploadBannerScreen.routeName,
            icon: CupertinoIcons.app_badge_fill,
          ),
          AdminMenuItem(
            title: 'Admin Menu',
            icon: Icons.dashboard,
            children: [
              AdminMenuItem(
                title: 'Utilizadores',
                route: '/',
                icon: CupertinoIcons.person_2_square_stack_fill,
              ),
              AdminMenuItem(
                title: 'Configurações',
                route: '/',
                icon: CupertinoIcons.settings,
              ),
              AdminMenuItem(
                title: 'Sair',
                route: '/',
                icon: Icons.logout_outlined,
              ),
            ],
          ),
        ],
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0x00020b50),
          child: Icon(
            Icons.person,
            color: Theme.of(context).colorScheme.secondary,
            size: 50,
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: Theme.of(context).colorScheme.secondary,
          child: const Center(
            child: Text(
              'Versão 0.0.1',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
        selectedRoute: '',
        onSelected: (item) {
          screenSelector(item);
        },
      ),
      body: _selectedItem,
    );
  }
}
