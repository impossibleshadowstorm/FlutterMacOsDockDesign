// import 'package:flutter/material.dart';
//
// class MacOsDock extends StatelessWidget {
//   const MacOsDock({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Dock(
//             items: const [
//               Icons.person,
//               Icons.message,
//               Icons.call,
//               Icons.camera,
//               Icons.photo,
//             ],
//             builder: (icon) {
//               return Draggable<IconData>(
//                 data: icon,
//                 feedback: _buildIconContainer(icon, Colors.black54, 48),
//                 childWhenDragging: _buildIconContainer(icon, Colors.transparent, 48),
//                 child: _buildIconContainer(icon, Colors.primaries[icon.hashCode % Colors.primaries.length], 48),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildIconContainer(IconData icon, Color color, double size) {
//     return Container(
//       constraints: BoxConstraints(minWidth: size, minHeight: size),
//       width: size,
//       height: size,
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: color,
//       ),
//       child: Center(child: Icon(icon, color: Colors.white)),
//     );
//   }
// }
//
// /// Dock of the reorderable [items].
// class Dock<T extends IconData> extends StatefulWidget {
//   const Dock({
//     super.key,
//     this.items = const [],
//     required this.builder,
//   });
//
//   /// Initial [T] items to put in this [Dock].
//   final List<T> items;
//
//   /// Builder building the provided [T] item.
//   final Widget Function(T) builder;
//
//   @override
//   State<Dock<T>> createState() => _DockState<T>();
// }
//
// /// State of the [Dock] used to manipulate the [_items].
// class _DockState<T extends IconData> extends State<Dock<T>> {
//   /// [T] items being manipulated.
//   late final List<T> _items = widget.items.toList();
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.black12,
//       ),
//       padding: const EdgeInsets.all(4),
//       duration: const Duration(milliseconds: 1000),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: List.generate(_items.length, (index) {
//           return DragTarget<T>(
//             onAccept: (data) {
//               setState(() {
//                 final draggedIndex = _items.indexOf(data);
//                 final targetItem = _items[index];
//                 _items[draggedIndex] = targetItem;
//                 _items[index] = data;
//               });
//             },
//             builder: (context, candidateData, rejectedData) {
//               return _buildDragTarget(index);
//             },
//           );
//         }),
//       ),
//     );
//   }
//
//   Widget _buildDragTarget(int index) {
//     return Draggable<T>(
//       data: _items[index],
//       feedback: _buildIconContainer(_items[index], Colors.black54, 48),
//       childWhenDragging: const SizedBox(),
//       child: _buildIconContainer(
//           _items[index], Colors.primaries[_items[index].hashCode % Colors.primaries.length], 48),
//     );
//   }
//
//   Widget _buildIconContainer(T icon, Color color, double size) {
//     return Container(
//       constraints: BoxConstraints(minWidth: size, minHeight: size),
//       width: size,
//       height: size,
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: color,
//       ),
//       child: Center(child: Icon(icon, color: Colors.white)),
//     );
//   }
// }

// Animated one
// import 'package:flutter/material.dart';
//
// class MacOsDock extends StatelessWidget {
//   const MacOsDock({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Dock(
//             items: const [
//               Icons.person,
//               Icons.message,
//               Icons.call,
//               Icons.camera,
//               Icons.photo,
//             ],
//             builder: (icon) {
//               return Draggable<IconData>(
//                 data: icon,
//                 feedback: _buildIconContainer(icon, Colors.black54, 48),
//                 childWhenDragging: _buildIconContainer(icon, Colors.transparent, 48),
//                 child: _buildIconContainer(icon, Colors.primaries[icon.hashCode % Colors.primaries.length], 48),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildIconContainer(IconData icon, Color color, double size) {
//     return Container(
//       constraints: BoxConstraints(minWidth: size, minHeight: size),
//       width: size,
//       height: size,
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: color,
//       ),
//       child: Center(child: Icon(icon, color: Colors.white)),
//     );
//   }
// }
//
// /// Dock of the reorderable [items].
// class Dock<T extends IconData> extends StatefulWidget {
//   const Dock({
//     super.key,
//     this.items = const [],
//     required this.builder,
//   });
//
//   /// Initial [T] items to put in this [Dock].
//   final List<T> items;
//
//   /// Builder building the provided [T] item.
//   final Widget Function(T) builder;
//
//   @override
//   State<Dock<T>> createState() => _DockState<T>();
// }
//
// /// State of the [Dock] used to manipulate the [_items].
// class _DockState<T extends IconData> extends State<Dock<T>> {
//   /// [T] items being manipulated.
//   late final List<T> _items = widget.items.toList();
//   bool isDragging = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final double dockWidth = isDragging
//         ? (_items.length - 1) * 64 + 16.0 // Smaller width when dragging
//         : _items.length * 64 + 16.0;
//
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//       width: dockWidth,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.black12,
//       ),
//       padding: const EdgeInsets.all(4),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: List.generate(_items.length, (index) {
//           return DragTarget<T>(
//             onAccept: (data) {
//               setState(() {
//                 final draggedIndex = _items.indexOf(data);
//                 final targetItem = _items[index];
//                 _items[draggedIndex] = targetItem;
//                 _items[index] = data;
//                 isDragging = false;
//               });
//             },
//             onWillAccept: (data) {
//               setState(() => isDragging = true);
//               return true;
//             },
//             onLeave: (data) {
//               setState(() => isDragging = false);
//             },
//             builder: (context, candidateData, rejectedData) {
//               return _buildDragTarget(index);
//             },
//           );
//         }),
//       ),
//     );
//   }
//
//   Widget _buildDragTarget(int index) {
//     return Draggable<T>(
//       data: _items[index],
//       feedback: _buildIconContainer(_items[index], Colors.black54, 48),
//       childWhenDragging: const SizedBox(),
//       child: _buildIconContainer(
//           _items[index], Colors.primaries[_items[index].hashCode % Colors.primaries.length], 48),
//     );
//   }
//
//   Widget _buildIconContainer(T icon, Color color, double size) {
//     return Container(
//       constraints: BoxConstraints(minWidth: size, minHeight: size),
//       width: size,
//       height: size,
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: color,
//       ),
//       child: Center(child: Icon(icon, color: Colors.white)),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MacOsDock extends StatelessWidget {
  const MacOsDock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Dock(
            items: const [
              Icons.person,
              Icons.message,
              Icons.call,
              Icons.camera,
              Icons.photo,
            ],
            builder: (icon) {
              return Draggable<IconData>(
                data: icon,
                feedback: _buildIconContainer(icon, Colors.black54, 48),
                childWhenDragging:
                    _buildIconContainer(icon, Colors.transparent, 48),
                child: _buildIconContainer(
                    icon,
                    Colors.primaries[icon.hashCode % Colors.primaries.length],
                    48),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildIconContainer(IconData icon, Color color, double size) {
    return Container(
      constraints: BoxConstraints(minWidth: size, minHeight: size),
      width: size,
      height: size,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Center(child: Icon(icon, color: Colors.white)),
    );
  }
}

/// Dock of the reorderable [items].
class Dock<T extends IconData> extends StatefulWidget {
  const Dock({
    super.key,
    this.items = const [],
    required this.builder,
  });

  /// Initial [T] items to put in this [Dock].
  final List<T> items;

  /// Builder building the provided [T] item.
  final Widget Function(T) builder;

  @override
  State<Dock<T>> createState() => _DockState<T>();
}

/// State of the [Dock] used to manipulate the [_items].
class _DockState<T extends IconData> extends State<Dock<T>> {
  /// [T] items being manipulated.
  late final List<T> _items = widget.items.toList();
  bool isDraggingOutside = false;
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    // Dock width calculation based on whether an item is dragged outside
    final double dockWidth = isDraggingOutside
        ? (_items.length - 1) * 64 + 16.0 // Shrink width when item is outside
        : _items.length * 64 + 16.0; // Full width when item is inside

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: dockWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black12,
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_items.length, (index) {
          return DragTarget<T>(
            onAccept: (data) {
              setState(() {
                final draggedIndex = _items.indexOf(data);
                final targetItem = _items[index];
                _items[draggedIndex] = targetItem;
                _items[index] = data;
                isDraggingOutside = false;
              });
            },
            onWillAcceptWithDetails: (details) {
              setState(() => isDraggingOutside = false);
              return true;
            },
            onMove: (details) {
              setState(() {
                isDragging = true;
              });
              // Check if the drag location is outside the dock's area
              final RenderBox renderBox =
                  context.findRenderObject() as RenderBox;
              final Offset localOffset =
                  renderBox.globalToLocal(details.offset);
              if (localOffset.dx < 0 || localOffset.dx > dockWidth) {
                setState(() => isDraggingOutside = true);
              } else {
                setState(() => isDraggingOutside = false);
              }
            },
            onLeave: (data) {
              setState(() => isDraggingOutside = true);
            },
            builder: (context, candidateData, rejectedData) {
              return _buildDragTarget(index);
            },
          );
        }),
      ),
    );
  }

  Widget _buildDragTarget(int index) {
    return Draggable<T>(
      data: _items[index],
      feedback: _buildIconContainer(_items[index], Colors.black54, 48),
      childWhenDragging: const SizedBox(),
      child: _buildIconContainer(
          _items[index],
          Colors.primaries[_items[index].hashCode % Colors.primaries.length],
          48),
    );
  }

  Widget _buildIconContainer(T icon, Color color, double size) {
    return Container(
      constraints: BoxConstraints(minWidth: size, minHeight: size),
      width: size,
      height: size,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Center(child: Icon(icon, color: Colors.white)),
    );
  }
}
