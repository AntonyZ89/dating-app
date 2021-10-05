import 'package:dating_app/factories/model_factory.dart';
import 'package:dating_app/models/models.dart';

class UserFactory extends ModelFactory<UserModel> {
  @override
  generateFake() {
    return UserModel(
      id: createFakeUuid(),
      name: faker.person.name(),
      description: faker.lorem.sentence(),
      location: faker.address.streetAddress(),
      picture: faker.image.image(
        width: 1080,
        height: 1920,
        keywords: ['woman', 'face'],
        random: true,
      ),
      birthday: faker.date.dateTime(minYear: 1950, maxYear: 2003),
    );
  }

  @override
  generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}
