import '../../auth/model/budget_model.dart';

const List<BudgetModel> budgetOptions = [
  BudgetModel(
    value: "BELOW_2_LAKHS",
    label: "Below NPR 2 Lakhs",
  ),
  BudgetModel(
    value: "TWO_TO_FOUR",
    label: "NPR 2–4 Lakhs",
  ),
  BudgetModel(
    value: "FOUR_TO_SIX",
    label: "NPR 4–6 Lakhs",
  ),
  BudgetModel(
    value: "SIX_TO_EIGHT",
    label: "NPR 6–8 Lakhs",
  ),
  BudgetModel(
    value: "ABOVE_8",
    label: "Above NPR 8 Lakhs",
  ),
];