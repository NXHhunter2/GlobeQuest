"""Altered scores table

Revision ID: bd3c181eb299
Revises: add_gamemode_constraints
Create Date: 2025-03-29 17:26:47.817831

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'bd3c181eb299'
down_revision = 'add_gamemode_constraints'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('game_modes', schema=None) as batch_op:
        batch_op.alter_column('gamemode_name',
               existing_type=sa.TEXT(),
               type_=sa.String(),
               existing_nullable=False)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('game_modes', schema=None) as batch_op:
        batch_op.alter_column('gamemode_name',
               existing_type=sa.String(),
               type_=sa.TEXT(),
               existing_nullable=False)

    # ### end Alembic commands ###
