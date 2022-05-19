part of 'filtertransaction_cubit.dart';

@freezed
class FiltertransactionState with _$FiltertransactionState {
  const factory FiltertransactionState({required List<TransactionModel> filterList,required bool isFilter,required String fitlerDropdownValue}) = _FilterTransactionState;
  
   factory FiltertransactionState.initial() => FiltertransactionState(filterList: [],isFilter: false,fitlerDropdownValue: allFields[0]);
}
