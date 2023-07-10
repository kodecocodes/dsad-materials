// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/ring_buffer.dart';
import 'package:test/test.dart';

void main() {
  group('RingBuffer:', () {
    test('starts empty', () {
      final buffer = RingBuffer<String>(4);
      expect(buffer.isEmpty, true);
      expect(buffer.isFull, false);
      expect(buffer.peek, isNull);
    });

    test('writing one value works', () {
      final buffer = RingBuffer<String>(4);
      buffer.write('Chris');
      expect(buffer.isEmpty, false);
      expect(buffer.isFull, false);
      expect(buffer.peek, 'Chris');
    });

    test('normal read/write works', () {
      final buffer = RingBuffer<String>(4);

      buffer.write('Chris');
      expect(buffer.isEmpty, false);
      expect(buffer.isFull, false);
      expect(buffer.peek, 'Chris');

      buffer.write('Pablo');
      expect(buffer.isEmpty, false);
      expect(buffer.isFull, false);
      expect(buffer.peek, 'Chris');

      buffer.write('Manda');
      expect(buffer.isEmpty, false);
      expect(buffer.isFull, false);
      expect(buffer.peek, 'Chris');

      var value = buffer.read();
      expect(buffer.isEmpty, false);
      expect(buffer.isFull, false);
      expect(value, 'Chris');
      expect(buffer.peek, 'Pablo');

      value = buffer.read();
      expect(buffer.isEmpty, false);
      expect(buffer.isFull, false);
      expect(value, 'Pablo');
      expect(buffer.peek, 'Manda');

      buffer.write('Vicki');
      expect(buffer.isEmpty, false);
      expect(buffer.isFull, false);
      expect(buffer.peek, 'Manda');

      value = buffer.read();
      expect(buffer.isEmpty, false);
      expect(buffer.isFull, false);
      expect(value, 'Manda');
      expect(buffer.peek, 'Vicki');

      value = buffer.read();
      expect(buffer.isEmpty, true);
      expect(buffer.isFull, false);
      expect(value, 'Vicki');
      expect(buffer.peek, isNull);
    });

    test('Overflow throws exception', () {
      final buffer = RingBuffer<int>(4);
      buffer.write(1);
      buffer.write(2);
      buffer.write(3);
      buffer.write(4);
      expect(() => buffer.write(5), throwsException);
    });

    test('Reading empty buffer returns null', () {
      final buffer = RingBuffer<int>(4);
      expect(buffer.read(), isNull);
    });

    // https://github.com/kodecocodes/dsad-materials/pull/8
    test('toString contains no infinite loop', () {
      final buffer = RingBuffer<int>(3);
      buffer.write(1);
      buffer.write(2);
      buffer.write(3);
      buffer.read();
      expect(buffer.toString(), '[2, 3]');

      final rb = RingBuffer<String>(3);
      rb.write('Ray');
      rb.write('Brian');
      rb.write('Noah');
      expect(rb.read(), 'Ray');
      expect(rb.toString(), '[Brian, Noah]');
    });

// https://github.com/kodecocodes/dsad-materials/pull/8
    test('toString not empty when read and write index equal', () {
      final rb = RingBuffer<String>(3);
      rb.write('Ray');
      rb.write('Brian');
      rb.write('Noah');
      expect(rb.toString(), '[Ray, Brian, Noah]');
    });

    test('toString variations', () {
      var buffer = RingBuffer<int>(3);
      expect(buffer.toString(), '[]');

      buffer.write(1);
      expect(buffer.toString(), '[1]');

      buffer.write(2);
      expect(buffer.toString(), '[1, 2]');

      buffer.write(3);
      expect(buffer.toString(), '[1, 2, 3]');

      buffer.read();
      expect(buffer.toString(), '[2, 3]');

      buffer.write(4);
      expect(buffer.toString(), '[2, 3, 4]');

      buffer.read();
      expect(buffer.toString(), '[3, 4]');

      buffer.read();
      expect(buffer.toString(), '[4]');

      buffer.read();
      expect(buffer.toString(), '[]');

      buffer.read();
      expect(buffer.toString(), '[]');
    });
  });
}
