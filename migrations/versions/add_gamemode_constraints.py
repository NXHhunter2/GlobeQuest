"""Add missing constraints to game_modes table

Revision ID: add_gamemode_constraints
Create Date: 2024-01-11 10:00:00
"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.engine.reflection import Inspector

# revision identifiers, used by Alembic.
revision = 'add_gamemode_constraints'
down_revision = '4f6f265aa5d2'
branch_labels = None
depends_on = None


def upgrade():
    # Get database connection and inspector
    conn = op.get_bind()
    inspector = Inspector.from_engine(conn)
    
    # Get existing constraints
    constraints = inspector.get_unique_constraints('game_modes')
    primary_key = inspector.get_pk_constraint('game_modes')
    existing_constraint_names = set(c['name'] for c in constraints)
    if primary_key:
        existing_constraint_names.add(primary_key['name'])
    
    # Check and add PRIMARY KEY if missing
    if not primary_key.get('constrained_columns'):
        op.execute('ALTER TABLE game_modes ADD PRIMARY KEY (gamemode_id)')
        
    # Add UNIQUE constraint for gamemode_id if not present
    gamemode_id_unique = any(
        'gamemode_id' in c['column_names'] for c in constraints
    )
    if not gamemode_id_unique:
        op.create_unique_constraint(
            'uq_game_modes_gamemode_id',
            'game_modes',
            ['gamemode_id']
        )
    
    # Add UNIQUE constraint for gamemode_name if not present
    gamemode_name_unique = any(
        'gamemode_name' in c['column_names'] for c in constraints
    )
    if not gamemode_name_unique:
        op.create_unique_constraint(
            'uq_game_modes_gamemode_name',
            'game_modes',
            ['gamemode_name']
        )
    
    # Add NOT NULL constraint for gamemode_name if not present
    columns = inspector.get_columns('game_modes')
    gamemode_name_column = next(
        (col for col in columns if col['name'] == 'gamemode_name'),
        None
    )
    if gamemode_name_column and gamemode_name_column.get('nullable', True):
        op.alter_column(
            'game_modes',
            'gamemode_name',
            existing_type=sa.String(),
            nullable=False
        )


def downgrade():
    # Remove constraints in reverse order
    op.drop_constraint('uq_game_modes_gamemode_name', 'game_modes', type_='unique')
    op.drop_constraint('uq_game_modes_gamemode_id', 'game_modes', type_='unique')
    op.alter_column(
        'game_modes',
        'gamemode_name',
        existing_type=sa.String(),
        nullable=True
    )

