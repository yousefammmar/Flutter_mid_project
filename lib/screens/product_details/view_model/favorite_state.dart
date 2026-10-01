abstract class ProductDetailsState
{

}

class ProductInitialState extends ProductDetailsState
{

}

class ChangeIconState extends ProductDetailsState
{
final String email;

  new({required this.email});
}