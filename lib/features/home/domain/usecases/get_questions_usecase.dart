import 'package:dartz/dartz.dart';
import 'package:plant_app/core/error/failures.dart';
import 'package:plant_app/core/usecases/usecase.dart';
import 'package:plant_app/features/home/domain/entities/question_entity.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';

class GetQuestionsUsecase implements UseCase<List<QuestionEntity>, NoParams> {
  final HomeRepository repository;

  GetQuestionsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<QuestionEntity>>> call(NoParams params) async {
    return await repository.getQuestions();
  }
}
